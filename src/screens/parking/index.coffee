{Component} = React = require 'react'
{Alert} = require 'react-native'
{connect} = require 'react-redux'
linking = require 'src/libs/linking'
Screen = require './screen'


class Parking extends Component
  state:
    searchText: ""


  render: ->
    `<Screen
      places={this.getPlaces()}
      searchText={this.state.setSearchText}
      onSelect={this.props.onShowMap}
      onSearch={this.setSearchText} />`


  getPlaces: ->
    nameContains = (text) -> (place) ->
      place.get('name').toLowerCase().includes(text)

    setType = (type) -> (place) ->
      place.set('type', type)

    search = (places, type, text) ->
      places
        .filter(nameContains(text))
        .map(setType(type))
        .toList()

    searchText = @state.searchText.toLowerCase()
    stores = search(@props.stores, 'store', searchText)
    dining = search(@props.dining, 'dining', searchText)
    
    stores.concat(dining).toJS()


  setSearchText: (text) =>
    @setState(searchText: text)


mapStateToProps = (state) ->
  stores: state.store.places
  dining: state.dining.places
  onShowMap: (id, type) ->
    switch type
      when 'store'
        places = state.store.places
      when 'dining'
        places = state.dining.places

    parkingIds = places.get(id).get('parking')
    if not parkingIds or parkingIds.length is 0
      return Alert.alert("No parking", "Parking was not configured for this place")

    parkings = state.parking
      .filter (_, key) -> parkingIds.includes(key)
      .toList().toJS()

    parking = parkings[0]
    location =
      label: parking.title
      lat: parking.latitude
      long: parking.longitude

    linking.openMap(location, route=yes)


module.exports = connect(mapStateToProps)(Parking)
