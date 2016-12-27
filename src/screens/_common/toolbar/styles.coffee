{StyleSheet} = require 'react-native'
{gray} = require 'src/colors'


module.exports = StyleSheet.create
  toolbar:
    height: 56
    backgroundColor: 'white'
    borderColor: gray
    borderBottomWidth: 1

  title:
    marginBottom: 8
    marginLeft: 48
    textAlignVertical: 'center'
    alignSelf: 'flex-start'
    fontSize: 20
    fontWeight: '500'
    flex: 1

  titleIOS:
    marginBottom: 10
    textAlignVertical: 'center'
    fontSize: 20
    fontWeight: '500'
    flex: 1

  button:
    alignSelf: 'center'
    alignItems: 'center'
    justifyContent: 'center'
    height: 48
    width: 48

  logo:
    alignSelf: 'flex-start'
    marginLeft: 48
    width: 128
    height: 40
    resizeMode: 'contain'

  logoIOS:
    alignSelf: 'center'
    width: 128
    height: 40
    resizeMode: 'contain'

  searchField:
    alignSelf: 'stretch'
    height: 44
    marginHorizontal: 48
