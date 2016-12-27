set = require 'lodash.set'
{serviceActionTypePath, serviceActionType} = require '../utils'


setServiceTypes = (types, service) ->
  setActionType = (types, action) ->
    if action.reduxAction # custom reducer, skip
      return types
    
    path = serviceActionTypePath(service.name, action) # 'Promo.Offers.Updated'
    type = serviceActionType(service.name, action) # 'PROMO_OFFERS_UPDATED'

    set(types, path, type)

  service.actions.reduce(setActionType, types)


makeTypes = (services) ->
  services.reduce(setServiceTypes, {})


module.exports = makeTypes
