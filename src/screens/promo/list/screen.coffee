{
  ListView
  View
  Text
  Image
  TouchableOpacity
} = require 'react-native'
{Component} = React = require 'react'
{Card, Button, TYPO} = require 'react-native-material-design'
{default: Media} = require './card'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  @defaultProps:
    promos: []


  constructor: (props) ->
    super
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)
    @state = dataSource: dataSource.cloneWithRows(props.promos)


  componentWillReceiveProps: (nextProps) ->
    promos = nextProps.promos or Screen.defaultProps.promos
    @setState(dataSource: @state.dataSource.cloneWithRows(promos))


  render: ->
    `<ListView
      dataSource={this.state.dataSource}
      renderRow={this.renderPromo}
      enableEmptySections={true}
      style={styles.list} />`


  renderPromo: (promo) =>
    `<Card>
      <Media image={<Image source={{uri: promo.image}} />} height={300} overlay>
        <Text style={[TYPO.paperFontHeadline, styles.title]}>{promo.title}</Text>
      </Media>
      <Card.Body>
        <Text style={gstyles.gray}>{promo.description}</Text>
      </Card.Body>
      { (promo.browserLink || promo.shareLink) &&
        <Card.Actions position='right'>
          { promo.browserLink &&
            <Button overrides={styles.extra.buttonStyle} text="OPEN" onPress={this.select(promo.id)}/>
          }
          { promo.shareLink &&
            <Button overrides={styles.extra.buttonStyle} text="SHARE" onPress={this.share(promo.id)}/>
          }
        </Card.Actions>
      }
    </Card>`


  select: (id) => =>
    @props.onSelect?(id)

    
  share: (id) => =>
    @props.onShare?(id)


module.exports = Screen
