# return map of basic reducers
# found, created, updated, patched, removed actions for each service


{handleActions} = require 'redux-actions'
{combineReducers} = require 'redux'
Immutable = require 'immutable'
set = require 'lodash.set'
xor = require 'lodash.xor'
{
  servicePath
  serviceActionType
  notImplemented
} = require '../utils'
{mapObject} = require 'src/libs/utils'


# standard reducers
mergeItem = (state, item) ->
  state.mergeIn([item.id], item)


replaceAll = (state, action) ->
  items = action.payload

  if not state.isEmpty()
    newIds = items.map (item) -> item.id
    ids = state.keys()
    diffIds = xor(ids, newIds)

    if diffIds.length isnt 0
      # create new state if new or removed items
      state = Immutable.Map()

  items.reduce(mergeItem, state)


update = (state, action) ->
  item = action.payload
  mergeItem(state, item)


remove = (state, action) ->
  item = action.payload
  state.remove(item.id)


Reducers =
  found: replaceAll
  created: update
  updated: update
  patched: update
  removed: remove


setServiceReducer = (tree, service) ->
  setActionReducer = (reducerMap, action) ->
    if action.reduxAction # custom reducer, skip
      return reducerMap
    
    type = serviceActionType(service.name, action) # 'PROMO_OFFERS_UPDATED'
    reducer = Reducers[action.name] or notImplemented
    reducerMap[type] = reducer
    
    return reducerMap

  reducerMap = service.actions.reduce(setActionReducer, {})
  reducer = handleActions(reducerMap, Immutable.Map())
  path = servicePath(service.name) # 'promo.offers'

  set(tree, path, reducer)


reducerTree = (services) ->
  services.reduce(setServiceReducer, {})


combine = (reducers, path) ->
  # do not combine service root path reducers
  if path.length is 0
    return reducers

  combineReducers(reducers)


makeReducers = (services) ->
  tree = reducerTree(services)
  mapObject(tree, null, null, combine)


module.exports = makeReducers
