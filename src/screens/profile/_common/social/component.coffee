{View, Text, ListView} = require 'react-native'
{Component} = React = require 'react'
Icon = require 'react-native-vector-icons/MaterialIcons'
Zocial = require 'react-native-vector-icons/Zocial'
{Button} = require 'react-native-material-design'
colors = require 'src/colors'
styles = require './styles'


class SocialNetworks extends Component
  @defaultProps:
    networks: []


  constructor: ->
    super
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)
    @state = dataSource: dataSource.cloneWithRows(@props.networks)


  render: ->
    `<ListView
      dataSource={this.state.dataSource}
      renderRow={this._renderNetwork} />`


  _renderNetwork: (network) ->
    Connect = if network.connected
      `<View style={{flexDirection: 'row'}}>
        <Icon name='check-circle' size={20} color={colors.lightGreen}/>
        <Text style={styles.connected}>CONNECTED</Text>
      </View>`
    else
      `<Button text="CONNECT" overrides={styles.extra.connectButton} />`

    `<View style={styles.scroll}>
      <View style={styles.infoContainer}>
        <Zocial name={network.icon} size={22} color={network.color} />
        <Text style={styles.name}>{network.name}</Text>
      </View>
      {Connect}
    </View>`


  _renderSeparator: (sectionId, rowId) ->
    id = "#{sectionId}-#{rowId}"
    `<View key={id} style={styles.separator} />`


module.exports = SocialNetworks
