{StyleSheet, PixelRatio} = require 'react-native'


module.exports = StyleSheet.create
  row:
    height: 76
    alignItems: 'center'
    flexDirection: 'row'

  title:
    marginLeft: 8
    fontSize: if PixelRatio.get() > 2 then 18 else 14

  logo:
    width: 96
    height: 32
    resizeMode: 'contain'
