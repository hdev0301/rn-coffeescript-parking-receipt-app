{StyleSheet} = require 'react-native'
colors = require 'src/colors'


module.exports = StyleSheet.create
  screen:
    flex: 1
    backgroundColor: 'white'
    paddingLeft: 16
    paddingVertical: 8

  infoContainer:
    marginBottom: 24

  phoneContainer:
    marginTop: 8
    flexDirection: 'row'

  phone:
    marginLeft: 16
    fontSize: 18

  bonus:
    flexDirection: 'row'
    justifyContent: 'space-between'

  bonusPoints:
    fontSize: 36
    color: colors.lightGreen

  separator:
    height: 1
    marginTop: 8
    backgroundColor: '#cccccc'

  infoHeader:
    fontWeight: 'bold'

  signUpButton:
    marginRight: 16
    marginVertical: 16

    
module.exports.extra =
  bonusMoreButton:
    textColor: colors.blue
