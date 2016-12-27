{convertDate} = require '../utils'


convertKey = (items) ->
  convert = (item) ->
    if not item.key
      return item

    item.id = item.key
    return item

  if Array.isArray(items)
    items.map(convert)
  else
    convert(items)


module.exports = (items) ->
  items = convertDate(items, '_createdAt', 'date')
  items = convertKey(items)
  return items
