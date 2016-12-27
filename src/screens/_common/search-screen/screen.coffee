{
  ListView
  View
  Image
  Text
  TouchableWithoutFeedback
  TouchableOpacity
} = require 'react-native'
{Component} = React = require 'react'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  constructor: ->
    super
    @state = dataSource: new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)


  componentWillReceiveProps: (nextProps) ->
    if nextProps.show
      items = @props.search?(nextProps.text) or []
      @setState(dataSource: @state.dataSource.cloneWithRows(items))


  render: ->
    `<View style={styles.screen}>
      {React.Children.only(this.props.children)}
      { this.props.show &&
        <View style={styles.container}>
          <TouchableWithoutFeedback onPress={this.overlayPress}>
            <View style={styles.overlay} />
          </TouchableWithoutFeedback>
          <ListView
            dataSource={this.state.dataSource}
            renderRow={this.renderItem}
            renderSeparator={this.renderSeparator}
            enableEmptySections={true}
            bounces={false}
            style={styles.list} />
        </View>
      }
    </View>`


  renderItem: (item) =>
    `<TouchableOpacity onPress={() => this.select(item.id)}>
      <View style={styles.row}>
        <View style={styles.imageContainer}>
          <Image source={{uri: item.image}} style={styles.image} />
        </View>
        <Text style={[gstyles.gray, styles.title]}>{item.title}</Text>
      </View>
    </TouchableOpacity>`


  renderSeparator: (sectionId, rowId) ->
    id = "#{sectionId}-#{rowId}"
    `<View key={id} style={gstyles.separator} />`


  overlayPress: =>
    @props.onOverlayPress?()


  select: (id) =>
    @props.onSelect?(id)


module.exports = Screen
