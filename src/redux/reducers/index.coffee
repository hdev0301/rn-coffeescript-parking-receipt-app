{combineReducers} = require 'redux'
merge = require 'lodash.merge'
ApiReducers = require 'src/api/redux/reducers'


Reducers =
  app: require './app'
  route: require './route'


module.exports = combineReducers(merge(ApiReducers, Reducers))
