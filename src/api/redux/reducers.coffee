merge = require 'lodash.merge'
services = require '../services'
makeServiceReducers = require './service/reducers'


Reducers =
  user: require './user/reducers'


serviceReducers = makeServiceReducers(services)

# we do not combine reducers
# so 'user' and services will be at root of redux storage
module.exports = merge(serviceReducers, Reducers)
