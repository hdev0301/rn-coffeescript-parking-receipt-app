{View, Text, TouchableOpacity} = require 'react-native'
{Component} = React = require 'react'
Icon = require 'react-native-vector-icons/MaterialIcons'
styles = require './style'


class IconButton extends Component
  @defaultProps:
    icon: 'check-circle'
    title: 'OK'
    onPress: ->


  render: ->
    `<TouchableOpacity onPress={this.props.onPress}>
      <View style={styles.button}>
        <Icon
          name={this.props.icon}
          size={styles.extra.iconSize}
          style={styles.title} />
        <Text style={styles.title}> {this.props.title}</Text>
      </View>
    </TouchableOpacity>`


module.exports = IconButton
