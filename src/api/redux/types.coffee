merge = require 'lodash.merge'
services = require '../services'
makeServiceTypes = require './service/types'


Types =
  User: require './user/types'
  Bonuses: require './bonuses/types'


serviceTypes = makeServiceTypes(services)

module.exports = merge(serviceTypes, Types)
