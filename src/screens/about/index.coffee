{connect} = require 'react-redux'
Screen = require './screen'
linking = require 'src/libs/linking'


mapStateToProps = (state) ->
  items = state.about
    .filter (item) -> item.get('visible')
    .sortBy (item) -> item.get('priority')

  items: items.toList().toJS()
  onSelect: (id) ->
    item = items.get(id)

    if not link = item.get('link')
      return

    parts = link.split(':')
    if parts.length >= 2 and parts[0] is 'map'
      linking.openMap(parts[1])
    else
      linking.openUrl(link)


module.exports = connect(mapStateToProps)(Screen)
