{capitalizeFirstLetter} = require 'src/libs/utils'


# 'promo.offers'
servicePath = (serviceName) ->
  servicePathParts(serviceName).join('.')


# 'Promo.Offers.Updated'
serviceActionTypePath = (serviceName, action) ->
  actionPathParts(serviceName, action).map(capitalizeFirstLetter).join('.')


# 'PROMO_OFFERS_UPDATED'
serviceActionType = (serviceName, action) ->
  actionPathParts(serviceName, action).join('_').toUpperCase()


# 'promo.offers.updated'
serviceActionPath = (serviceName, action) ->
  actionPathParts(serviceName, action).join('.')


notImplemented = ->
  throw new Error('NotImplementedException')


getApi = (state) ->
  state.app.get('api')
  
  
getCurrentScreen = (state) ->
  state.route.get('name')


serviceEvents = (service) ->
  service.actions
    .filter (action) -> action.isEvent
    .map (action) -> action.name



# ['promo', 'offers']
servicePathParts = (serviceName) ->
  serviceName.split('/')


# ['promo', 'offers', 'updated']
actionPathParts = (serviceName, action) ->
  if action.reduxAction
    return action.reduxAction.split('.')

  servicePathParts(serviceName).concat(action.name)


convertDate = (items, field, newField=field) ->
  convert = (item) ->
    if not item[field]
      return item

    item[newField] = new Date(item[field])

    if field isnt newField
      delete item[field]

    return item

  if Array.isArray(items)
    items.map(convert)
  else
    convert(items)


module.exports = {
  servicePath
  serviceActionTypePath
  serviceActionType
  serviceActionPath
  notImplemented
  getApi
  getCurrentScreen
  serviceEvents
  convertDate
}
