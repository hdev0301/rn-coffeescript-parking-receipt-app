{StyleSheet} = require 'react-native'
colors = require 'src/colors'


module.exports = StyleSheet.create
  screen:
    backgroundColor: 'white'
    paddingHorizontal: 16

  image:
    marginBottom: 8
    height: 128
    width: null
    resizeMode: 'contain'

  info:
    marginTop: 8

  firstButton:
    marginTop: 16

  button:
    marginVertical: 8

  bonus:
    flexDirection: 'row'
    justifyContent: 'space-between'

  bonusPoints:
    fontSize: 36
    color: colors.lightGreen

  tickets:
    flexDirection: 'row'
    alignItems: 'center'

  ticketsText:
    fontSize: 36
    color: colors.orange

  ticketsIcon:
    marginTop: 6

  activeRaffle:
    alignSelf: 'flex-end'
    color: colors.orange
    fontSize: 24
