{
  ListView
  TouchableOpacity
  View
  Text
  Image
} = require 'react-native'
Icon = require 'react-native-vector-icons/MaterialIcons'
{Component} = React = require 'react'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  @defaultProps:
    places: []
    onSelect: ->


  constructor: (props) ->
    super
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)
    @state = dataSource: dataSource.cloneWithRows(props.places)


  componentWillReceiveProps: (props) ->
    @setState(dataSource: @state.dataSource.cloneWithRows(props.places))


  render: ->
    `<ListView
      dataSource={this.state.dataSource}
      renderRow={this.renderPlace}
      renderSeparator={this.renderSeparator}
      enableEmptySections={true}
      style={styles.screen} />`


  renderPlace: (place) =>
    if place.logo
      logo = `<Image source={{uri: place.logo}} style={styles.logoImage} />`
    else
      logo = `<Icon
        name='store'
        size={styles.extra.storeIconSize}
        style={styles.logoIcon} />`

    `<TouchableOpacity onPress={() => this.props.onSelect(place.id)}>
      <View style={styles.row}>
        {logo}
        <Text style={[gstyles.gray, styles.title]}>{place.name}</Text>
      </View>
    </TouchableOpacity>`


  renderSeparator: (sectionId, rowId) ->
    id = "#{sectionId}-#{rowId}"
    `<View key={id} style={gstyles.separator} />`


module.exports = Screen
