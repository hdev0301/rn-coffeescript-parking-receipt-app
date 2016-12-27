{StyleSheet} = require 'react-native'


module.exports = StyleSheet.create
  container:
    flexDirection: 'row'
    justifyContent: 'center'

  bonus:
    flex: 1
    height: 56
    flexDirection: 'row'
    alignItems: 'center'

  infoContainer:
    left: 16

  separator:
    marginRight: 16

  pointsContainer:
    height: 48
    width: 48

  pointsTextContainer:
    position: 'absolute'
    width: 48
    height: 48
    left: 0
    top: 0
    alignItems: 'center'
    justifyContent: 'center'

  points:
    fontSize: 18
    color: 'white'
    backgroundColor: 'transparent'

  title:
    fontSize: 16
