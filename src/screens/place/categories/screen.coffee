{
  View
  ListView
  Text
  TouchableOpacity
} = require 'react-native'
{Component} = React = require 'react'
Icon = require 'react-native-vector-icons/MaterialIcons'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  @defaultProps:
    categories: []
    onSelect: ->


  constructor: (props) ->
    super
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)
    @state = dataSource: dataSource.cloneWithRows(props.categories)


  componentWillReceiveProps: (props) ->
    @setState(dataSource: @state.dataSource.cloneWithRows(props.categories))


  render: ->
    `<ListView
      dataSource={this.state.dataSource}
      renderRow={this.renderCategory}
      renderSeparator={this.renderSeparator}
      enableEmptySections={true}
      style={styles.list} />`


  renderCategory: (category) =>
    `<TouchableOpacity onPress={() => this.props.onSelect(category.id)}>
      <View style={styles.row}>
        <Text style={[gstyles.gray, styles.title]}>{category.title}</Text>
        <Icon style={[gstyles.gray, styles.chevron]} size={20} name='chevron-right' />
      </View>
    </TouchableOpacity>`


  renderSeparator: (sectionId, rowId) ->
    id = "#{sectionId}-#{rowId}"
    `<View key={id} style={gstyles.separator} />`
    

module.exports = Screen
