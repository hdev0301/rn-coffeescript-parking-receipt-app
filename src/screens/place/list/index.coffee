{connect} = require 'react-redux'
{Actions: RouteActions} = require 'react-native-router-flux'
Screen = require './screen'


mapStateToProps = (state, props) ->
  placeType = props.placeType
  category = props.category
  places = state[placeType].places
  
  placesProp = places
    .filter (place) -> place.get('categories')?.includes(category)
    .toList()
    .toJS()

  places: placesProp
  onSelect: (id) ->
    title = places.get(id)?.get('name')
    RouteActions.place(placeType: placeType, id: id, title: title)


module.exports = connect(mapStateToProps)(Screen)
