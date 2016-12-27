{View, Text, ListView} = require 'react-native'
{Component} = React = require 'react'
Icon = require 'react-native-vector-icons/MaterialIcons'
moment = require 'moment'
{lightGreen, lightRed, gray} = require 'src/colors'
styles = require './styles'
gstyles = require 'src/styles'


StatusColors = [
  gray
  lightGreen
  lightRed
]


class BonusList extends Component
  @defaultProps:
    bonuses: []


  constructor: ->
    super
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 isnt r2)
    @state = dataSource: dataSource.cloneWithRows(@props.bonuses)


  componentWillReceiveProps: (newProps) ->
    @state.dataSource = @state.dataSource.cloneWithRows(newProps.bonuses)


  render: ->
    `<View style={styles.container}>
      { this.props.bonuses.length !== 0 &&
        this.renderList() ||
        this.renderNoBonuses()
      }
    </View>`

      
  renderNoBonuses: ->
    `<Text style={gstyles.gray}>You have no bonus points yet</Text>`
    
    
  renderList: ->
    `<ListView
      dataSource={this.state.dataSource}
      renderRow={this.renderBonus}
      renderSeparator={this.renderSeparator}
      bounces={false}
      enableEmptySections={true} />`


  renderBonus: (bonus) ->
    `<View style={styles.bonus}>
      <View style={styles.pointsContainer}>
        <Icon name='brightness-1' size={48} color={StatusColors[bonus.status]} />
        <View style={styles.pointsTextContainer}>
          <Text style={styles.points} numberOfLines={1}>{bonus.points || "?"}</Text>
        </View>
      </View>
      <View style={styles.infoContainer}>
        <Text style={[gstyles.gray, styles.title]}>{bonus.description}</Text>
        <Text style={gstyles.gray}>{moment(bonus.date).calendar()}</Text>
      </View>
    </View>`


  renderSeparator: (sectionId, rowId) ->
    id = "#{sectionId}-#{rowId}"
    `<View key={id} style={[gstyles.separator, styles.separator]} />`


module.exports = BonusList
