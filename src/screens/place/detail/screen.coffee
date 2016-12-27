{
  ScrollView
  Image
  View
  Text
  TouchableOpacity
} = require 'react-native'
{Component} = React = require 'react'
IconButton = require '../../_common/icon-button'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  @defaultProps:
    onParking: ->


  render: ->
    hasParking = @props.place.parking?.length isnt 0

    `<ScrollView style={styles.screen}>
      { hasParking &&
        <IconButton
          title="PARKING"
          icon='local-parking'
          onPress={() => this.props.onParking(this.props.id)} />
      }
      <Image source={{uri: this.props.place.logo}} style={styles.logo} />
      <Text style={[gstyles.gray, styles.description]}>{this.props.place.description}</Text>
    </ScrollView>`


module.exports = Screen
