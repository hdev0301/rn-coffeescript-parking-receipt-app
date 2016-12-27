{View, ScrollView, Text} = require 'react-native'
{Component} = React = require 'react'
BonusList = require '../_common/bonus-list'
Button = require '../_common/button'
styles = require './styles'
gstyles = require 'src/styles'


class Screen extends Component
  render: ->
    `<ScrollView style={styles.screen} bounces={false}>
      <View style={styles.container}>
        { !this.props.registered &&
          <View>
            <Text style={[gstyles.gray, styles.description]}>Only registered users can earn bonus points!</Text>
            <Button
              title="SIGN UP"
              onPress={this.props.onSignUp}
              style={styles.button} />
          </View> ||
          <View>
            <Text style={[gstyles.gray, styles.description]}>Scan store receipts to get more bonus points!</Text>
            <Button
              title="SCAN RECEIPT"
              onPress={this.props.onScanReceipt}
              disabled={!this.props.registered}
              style={styles.button} />
          </View>
        }
        <Text style={styles.bonusPoints}>{this.props.points}</Text>
        <BonusList bonuses={this.props.bonuses} />
      </View>
    </ScrollView>`


module.exports = Screen
