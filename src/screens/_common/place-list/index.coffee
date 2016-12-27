{
  View
  ListView
  Text
  Image
  TouchableOpacity
} = require 'react-native'
{Component} = React = require 'react'
styles = require './styles'
gstyles = require 'src/styles'


class PlaceList extends Component
  @defaultProps:
    places: []


  constructor: (props) ->
    super(props)
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)
    @state = dataSource: dataSource.cloneWithRows(props.places)


  componentWillReceiveProps: (nextProps) ->
    places = nextProps.places or Screen.defaultProps.places
    @setState(dataSource: @state.dataSource.cloneWithRows(places))


  render: ->
    `<ListView
      dataSource={this.state.dataSource}
      renderRow={this.renderPlace}
      renderSeparator={this.renderSeparator}
      enableEmptySections={true} />`


  renderPlace: (place) =>
    `<TouchableOpacity onPress={() => this.select(place.id, place.type)}>
      <View style={styles.row}>
        <Image source={{uri: place.logo}} style={styles.logo} />
        <Text style={[gstyles.gray, styles.title]}>{place.name}</Text>
      </View>
    </TouchableOpacity>`


  renderSeparator: (sectionId, rowId) ->
    id = "#{sectionId}-#{rowId}"
    `<View key={id} style={gstyles.separator} />`


  select: (id, type) =>
    @props.onSelect?(id, type)


module.exports = PlaceList
