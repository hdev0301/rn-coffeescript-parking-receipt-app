{StyleSheet, PixelRatio} = require 'react-native'


module.exports = StyleSheet.create
  screen:
    flex: 1

  container:
    position: 'absolute'
    top: 0
    left: 0
    right: 0
    bottom: 0

  overlay:
    flex: 1
    backgroundColor: 'black'
    opacity: 0.5

  list:
    position: 'absolute'
    top: 0
    left: 0
    right: 0
    backgroundColor: 'white'

  row:
    height: 76
    alignItems: 'center'
    flexDirection: 'row'

  title:
    marginLeft: 8
    fontSize: if PixelRatio.get() > 2 then 18 else 14

  image:
    width: 96
    height: 32
    resizeMode: 'contain'
