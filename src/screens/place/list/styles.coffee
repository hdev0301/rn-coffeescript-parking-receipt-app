{StyleSheet, PixelRatio} = require 'react-native'


module.exports = StyleSheet.create
  screen:
    backgroundColor: 'white'
    paddingHorizontal: 16

  row:
    height: 76
    alignItems: 'center'
    flexDirection: 'row'

  title:
    marginLeft: 8
    fontSize: if PixelRatio.get() > 2 then 18 else 14

  logoImage:
    width: 96
    height: 48
    resizeMode: 'contain'

  logoIcon:
    width: 96
    textAlign: 'center'


module.exports.extra =
  storeIconSize: 40
