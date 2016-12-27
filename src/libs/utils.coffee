isObjectLike = require 'lodash.isobjectlike'


getRandomColor = ->
  letters = '0123456789abcdef'.split('')
  parts = letters[Math.floor(Math.random() * 16)] for i in [0...6]
  return "##{parts.join('')}"


genRandomHex = ->
  Math.random().toString(36).substring(2)


capitalizeFirstLetter = (str) ->
  str[0].toUpperCase() + str[1..]


lowercaseFirstLetter = (str) ->
  str[0].toLowerCase() + str[1..]  


toLowerCase = (str) ->
  str.toLowerCase()  


mapObject = (object, setValue, setKey, reduceObject) ->
  _mapObject = (object, setValue, setKey, path = []) ->
    result = {}

    for key, value of object
      nextPath = path.concat(key)
      key = setKey?(key, nextPath) or key

      if isObjectLike(value)
        result[key] = _mapObject(value, setValue, setKey, nextPath)
      else
        result[key] = setValue?(value, nextPath) or value

    return reduceObject?(result, path) or result

  _mapObject(object, setValue, setKey)


delay = (time, callback) ->
  setTimeout(callback, time)


async = (callback) ->
  delay(0, callback)


module.exports = {
  getRandomColor
  genRandomHex
  capitalizeFirstLetter
  lowercaseFirstLetter
  toLowerCase
  mapObject
  delay
  async
}
