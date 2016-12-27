get = require 'lodash.get'
services = require '../../services'
{serviceActionPath} = require '../utils'
Actions = require 'src/redux/actions'


serviceActionByName = (serviceName, actionName) ->
  service = services.find (service) -> service.name is serviceName
  service.actions.find (action) -> action.name is actionName


serviceReduxAction = (serviceName, action) ->
  path = serviceActionPath(serviceName, action) # 'promo.offers.updated'

  if not reduxAction = get(Actions, path)
    throw new Error("Empty redux action; path is '#{path}'")
    
  return reduxAction


module.exports = {
  serviceReduxAction
  serviceActionByName
}
