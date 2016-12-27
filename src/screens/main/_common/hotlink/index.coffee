{
  View
  Text
  TouchableOpacity
} = require 'react-native'
{Component} = React = require 'react'
MaterialIcons = require 'react-native-vector-icons/MaterialIcons'
styles = require './styles'


class HotLink extends Component
  @defaultProps:
    iconSet: MaterialIcons


  render: ->
    Icon = @props.iconSet
    `<TouchableOpacity onPress={this.click} style={styles.container}>
      <View>
        <Icon name={this.props.icon} size={32} style={styles.icon} />
        <View style={styles.titleContainer}>
          <Text style={styles.title}>{this.props.title.toUpperCase()}</Text>
        </View>
      </View>
    </TouchableOpacity>`


  click: =>
    @props.onClick?(@props.id)


module.exports = HotLink
