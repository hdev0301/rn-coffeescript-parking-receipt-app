{View, Text, ScrollView} = require 'react-native'
{Component} = React = require 'react'
Icon = require 'react-native-vector-icons/MaterialIcons'
{Button: TextButton} = require 'react-native-material-design'
Button = require '../_common/button'
BonusList = require '../_common/bonus-list'
SocialNetworks = require './_common/social'
styles = require './styles'
gstyles = require 'src/styles'


class Separator extends Component
  render: ->
    `<View style={styles.separator} />`


class Screen extends Component
  render: ->
    `<ScrollView style={styles.screen} bounces={false}>
      <View style={styles.container}>
        { !this.props.registered &&
          <Button
            title="SIGN UP"
            onPress={this.props.onSignUp}
            style={styles.signUpButton} /> ||
          <View style={styles.infoContainer}>
            <Text style={[gstyles.gray, styles.infoHeader]}>Phone number</Text>
            <Separator />
            <View style={styles.phoneContainer}>
              <Icon name='phone' size={28} style={gstyles.gray}/>
              <Text style={[gstyles.gray, styles.phone]}>{this.props.phone}</Text>
            </View>
          </View>
        }


        <View style={styles.infoContainer}>
          <Text style={[gstyles.gray, styles.infoHeader]}>Bonus points</Text>
          <Separator />
          <View style={styles.bonus}>
            <Text style={styles.bonusPoints}>{this.props.points}</Text>
            <TextButton
              text="SHOW ALL"
              overrides={styles.extra.bonusMoreButton}
              onPress={this.moreBonuses} />
          </View>
          <BonusList bonuses={this.props.bonuses} />
        </View>
      </View>
    </ScrollView>`


  moreBonuses: =>
    @props.onMoreBonuses?()


module.exports = Screen
