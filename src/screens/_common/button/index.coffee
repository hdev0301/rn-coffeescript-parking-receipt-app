{View, Text, TouchableOpacity} = require 'react-native'
{Component} = React = require 'react'
styles = require './styles'


class Button extends Component
  render: ->
    `<TouchableOpacity onPress={this.props.onPress} {...this.props}>
      <View style={[styles.button, this.props.disabled && styles.disabledButton]}>
        <Text style={styles.title}>{this.props.title}</Text>
        {this.props.children}
      </View>
    </TouchableOpacity>`


module.exports = Button
