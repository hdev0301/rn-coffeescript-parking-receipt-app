{Component} = React = require 'react'
{
  ListView
  Image
  View
  Text
  TouchableOpacity
} = require 'react-native'
Icon = require 'react-native-vector-icons/MaterialIcons'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  @defaultProps:
    items: []
    onSelect: ->


  constructor: (props) ->
    super
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)
    @state = dataSource: dataSource.cloneWithRows(props.items)


  componentWillReceiveProps: (props) ->
    @state.dataSource = @state.dataSource.cloneWithRows(props.items)


  render: ->
    `<ListView
      dataSource={this.state.dataSource}
      renderRow={this.renderItem}
      renderSeparator={this.renderSeparator}
      enableEmptySections={true}
      bounces={false}
      style={styles.list} />`


  renderItem: (item) =>
    `<TouchableOpacity onPress={() => this.props.onSelect(item.id)}>
      <View style={styles.infoContainer}>
        <Icon name={item.icon} size={28} style={gstyles.gray} />
        <Text style={[gstyles.gray, styles.text]}>{item.description}</Text>
      </View>
    </TouchableOpacity>`


  renderSeparator: (sectionId, rowId) ->
    id = "#{sectionId}-#{rowId}"
    `<View key={id} style={[gstyles.separator, styles.separator]} />`


module.exports = Screen
