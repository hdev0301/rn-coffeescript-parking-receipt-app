{combineReducers} = require 'redux'


module.exports = combineReducers
  auth: require './auth/reducers'
  info: require './info/reducers'
