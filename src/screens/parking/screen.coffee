{
  View
  Text
  TextInput
} = require 'react-native'
{Component} = React = require 'react'
PlaceList = require '../_common/place-list'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  render: ->
    `<View style={styles.screen}>
      <Text style={[gstyles.gray, styles.description]}>
        Select store and we will advise you best parking place
      </Text>

      <TextInput
        ref={(c) => this.searchField = c}
        onChangeText={this.props.onSearch}
        value={this.props.searchText}
        autoFocus={false}
        onSubmitEditing={() => this.searchField.blur()}
        placeholder="Search"
        style={styles.search} />

      <PlaceList places={this.props.places} onSelect={this.props.onSelect} />
    </View>`


module.exports = Screen
