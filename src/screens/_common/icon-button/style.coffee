{StyleSheet} = require 'react-native'
colors = require 'src/colors'


module.exports = StyleSheet.create
  button:
    marginVertical: 6
    paddingHorizontal: 8
    height: 36
    flexDirection: 'row'
    alignItems: 'center'
    justifyContent: 'center'
    backgroundColor: colors.blue

  title:
    color: 'white'


module.exports.extra =
  iconSize: 20
