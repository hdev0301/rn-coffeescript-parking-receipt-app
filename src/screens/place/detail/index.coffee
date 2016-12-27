{connect} = require 'react-redux'
linking = require 'src/libs/linking'
Screen = require './screen'


mapStateToProps = (state, props) ->
  type = props.placeType
  places = state[type].places
  place = places.get(props.id)

  place: place.toJS()
  onParking: (id) ->
    parkingIds = places.get(id).get('parking')

    parkings = state.parking
      .filter (_, key) -> parkingIds.includes(key)
      .toList().toJS()

    parking = parkings[0]
    location =
      label: parking.title
      lat: parking.latitude
      long: parking.longitude

    linking.openMap(location, route=yes)


module.exports = connect(mapStateToProps)(Screen)
