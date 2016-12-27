{
  ScrollView
  Image
  View
  Text
} = require 'react-native'
{Component} = React = require 'react'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  render: ->
    `<ScrollView style={styles.scroll} bounces={false}>
      <Image source={{uri: this.props.promo.image}} style={styles.logo} />
      <Text style={[gstyles.gray, styles.description]}>{this.props.promo.description}</Text>
    </ScrollView>`


module.exports = Screen
