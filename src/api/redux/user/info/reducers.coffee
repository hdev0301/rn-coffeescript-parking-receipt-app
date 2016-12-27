Immutable = require 'immutable'
{handleActions} = require 'redux-actions'
Info = require './types'


setInfo = (state, action) ->
  Immutable.fromJS(action.payload)


reducers =
  "#{Info.Updated}": setInfo


initialState = Immutable.Map()


module.exports = handleActions(reducers, initialState)
