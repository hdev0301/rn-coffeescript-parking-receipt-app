{
  View
  Text
  ListView
  Image
  TouchableOpacity
} = require 'react-native'
{Component} = React = require 'react'
Icon = require 'react-native-vector-icons/MaterialIcons'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  @defaultProps:
    items: []
    onSelect: ->


  constructor: ->
    super
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)
    @state = dataSource: dataSource.cloneWithRows(@props.items)


  render: ->
    `<View style={styles.screen}>
      <Image source={require('src/res/images/logo.png')} style={styles.logo} />
      <ListView
        dataSource={this.state.dataSource}
        renderRow={this.renderItem}
        renderSeparator={this.renderSeparator}
        bounces={false} />
    </View>`


  renderItem: (item) =>
    `<TouchableOpacity onPress={() => this.props.onSelect(item.id)}>
      <View style={styles.row}>
        <View style={styles.titleContainer}>
          { item.icon && <Icon style={[gstyles.gray, styles.icon]} name={item.icon} size={20} /> }
          <Text style={[gstyles.gray, styles.title]}>{item.title.toUpperCase()}</Text>
        </View>
        <Icon style={[gstyles.gray, styles.chevron]} size={20} name='chevron-right' />
      </View>
    </TouchableOpacity>`


  renderSeparator: (sectionId, rowId) ->
    id = "#{sectionId}-#{rowId}"
    `<View key={id} style={gstyles.separator} />`


module.exports = Screen
