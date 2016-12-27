{StyleSheet} = require 'react-native'
colors = require 'src/colors'


module.exports = StyleSheet.create
  button:
    paddingHorizontal: 8
    height: 36
    flexDirection: 'row'
    justifyContent: 'center'
    alignItems: 'center'
    backgroundColor: colors.blue

  title:
    color: 'white'

  disabledButton:
    opacity: 0.5
