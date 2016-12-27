{
  View
  Text
  Image
  ScrollView
  TouchableOpacity
  Linking
  Platform
} = require 'react-native'
{Component} = React = require 'react'
Icon = require 'react-native-vector-icons/MaterialIcons'
Button = require '../_common/button'
styles = require './styles'
colors = require 'src/colors'
{bold} = gstyles = require 'src/styles'


class Screen extends Component
  render: ->
    canBuyTicket = @props.enoughPoints and @props.activeRaffle

    `<ScrollView style={styles.screen} bounces={false}>
      <Image
        source={require('src/res/images/raffle.jpg')}
        style={styles.image} />
      <Text style={gstyles.gray}>
        <Text style={bold}>WIN AED 3000 DAILY{'\n\n'}</Text>

        {this.props.description}
      </Text>

      <Text style={[gstyles.gray, styles.info]}>
        <Text onPress={this.openTerms} style={[bold, {textDecorationLine: 'underline'}]}>
          Full raffle terms you can find here.
        </Text>{" "}
        { Platform.OS === 'ios' &&
          <Text style={gstyles.gray}>
            Apple are not involved in any way with the raffle.
          </Text>
        }
      </Text>

      { !this.props.activeRaffle &&
        <Text style={[gstyles.gray, styles.info]}>
          Raffle is not active now. Please wait for next raffle.
        </Text>
      }

      { !this.props.enoughPoints &&
        <Text style={[gstyles.gray, styles.info]}>
          You have no enough bonus points to get raffle entry. Press <Text style={bold}>GET MORE POINTS</Text> to earn bonus points.
        </Text>
      }

      { !!this.props.activeRaffle &&
        <Text style={styles.activeRaffle}>
          {this.props.activeRaffle.title}
        </Text>
      }

      <View style={styles.bonus}>
        <Text style={styles.bonusPoints}>
          {this.props.points + " points"}
        </Text>
        <View style={styles.tickets}>
          <Icon
            name='local-play'
            size={36}
            color={colors.orange}
            style={styles.ticketsIcon} />
          <Text style={styles.ticketsText}> x {this.props.ticketCount}</Text>
        </View>
      </View>

      <Button
        title={"GET RAFFLE DRAW ENTRY (" + this.props.ticketPrice + " POINTS)"}
        onPress={this.props.onBuyTicket}
        disabled={!canBuyTicket}
        style={[styles.button, styles.firstButton]} />
      <Button
        title="GET MORE POINTS"
        onPress={this.props.onGetBonuses}
        style={styles.button} />
    </ScrollView>`


  openTerms: ->
    url = "http://bawadimall.com/leasing.php"
    Linking.canOpenURL(url).then (supported) ->
      if supported
        Linking.openURL(url)


module.exports = Screen
