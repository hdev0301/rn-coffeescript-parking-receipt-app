{call, put, take, select, fork} = require 'redux-saga/effects'
Auth = require '../user/auth/types'
{ApiInitialized} = require 'src/redux/types'
services = require '../../services'
Channel = require 'src/libs/channel'
{getApi, serviceEvents} = require '../utils'
{serviceActionByName, serviceReduxAction} = require './utils'


subscribeServices = ->
  yield take(ApiInitialized)

  api = yield select(getApi)
  channel = new Channel()

  yield services.map (service) ->
    events = serviceEvents(service)
    
    fork api.subscribeService, service.name, events, ->
      channel.put(arguments)

  while yes
    [serviceName, event, data] = yield call(channel.take)
    yield from dispatchServiceAction(serviceName, event, data)


updateBasicServices = ->
  yield take(ApiInitialized)

  yield from updateServices (service) ->
    service.initialUpdate and not service.requireAuth
  
  
updateServicesWithAuth = ->
  yield take(Auth.SignedIn)

  yield from updateServices (service) ->
    service.initialUpdate and service.requireAuth


# internal
dispatchServiceAction = (serviceName, actionName, data) ->
  action = serviceActionByName(serviceName, actionName)

  if action.convert
    data = action.convert(data)

  if data
    reduxAction = serviceReduxAction(serviceName, action)
    yield put(reduxAction(data))


updateService = (name) ->
  api = yield select(getApi)

  try
    data = yield call(api.getServiceData, name)
    yield from dispatchServiceAction(name, 'found', data)
  catch error
    console.error(error)

  
updateServices = (filter) ->
  forkEffect = (service) -> fork(updateService, service.name)
  yield services.filter(filter).map(forkEffect)


module.exports = -> yield [
  fork(subscribeServices)
  fork(updateBasicServices)
  fork(updateServicesWithAuth)
]
