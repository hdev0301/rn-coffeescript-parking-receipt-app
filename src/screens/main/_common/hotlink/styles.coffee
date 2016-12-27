{StyleSheet} = require 'react-native'
{gray} = require 'src/colors'


module.exports = StyleSheet.create
  container:
    flex: 1
    alignItems: 'center'

  icon:
    textAlign: 'center'
    color: gray
    backgroundColor: 'transparent'

  titleContainer:
    flex: 1
    paddingTop: 4
    justifyContent: 'center'

  title:
    textAlign: 'center'
    color: gray
    backgroundColor: 'transparent'
