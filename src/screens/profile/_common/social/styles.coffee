{StyleSheet} = require 'react-native'
colors = require 'src/colors'


module.exports = StyleSheet.create
  scroll:
    top: 8
    height: 48
    flexDirection: 'row'
    justifyContent: 'space-between'
    alignItems: 'center'

  infoContainer:
    flexDirection: 'row'

  name:
    marginLeft: 22
    fontSize: 18

  separator:
    height: 1
    backgroundColor: '#cccccc'

  connected:
    marginRight: 16
    marginLeft: 8
    color: colors.lightGreen
    fontWeight: 'bold'


module.exports.extra =
  connectButton:
    textColor: colors.blue
