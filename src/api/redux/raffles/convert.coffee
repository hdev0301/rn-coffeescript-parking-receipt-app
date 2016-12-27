{convertDate} = require '../utils'


module.exports = (items) ->
  items = convertDate(items, '_createdAt', 'date')
  items = convertDate(items, 'from')
  items = convertDate(items, 'to')
  return items
