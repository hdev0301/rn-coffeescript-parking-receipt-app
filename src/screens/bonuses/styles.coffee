{StyleSheet} = require 'react-native'
colors = require 'src/colors'


module.exports = StyleSheet.create
  screen:
    backgroundColor: 'white'
    paddingHorizontal: 16

  container:
    marginVertical: 16

  description:
    textAlign: 'center'

  button:
    marginTop: 16

  bonusPoints:
    marginTop: 16
    fontSize: 36
    color: colors.lightGreen
