{StyleSheet} = require 'react-native'


module.exports = StyleSheet.create
  screen:
    flex: 1
    backgroundColor: 'white'

  logo:
    marginVertical: 8
    height: 40
    width: 250
    resizeMode: 'contain'

  row:
    height: 48
    alignItems: 'center'
    flexDirection: 'row'
    justifyContent: 'space-between'

  titleContainer:
    marginLeft: 16
    flexDirection: 'row'

  icon:
    marginRight: 16

  title:
    fontSize: 16

  chevron:
    marginRight: 16
