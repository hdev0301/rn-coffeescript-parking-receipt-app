{createAction} = require 'redux-actions'
Types = require './types'
{mapObject, lowercaseFirstLetter} = require 'src/libs/utils'


getAction = (type) ->
  createAction(type)


module.exports = mapObject(Types, getAction, lowercaseFirstLetter)
