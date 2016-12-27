{StyleSheet} = require 'react-native'
{lightRed} = require 'src/colors'


module.exports = StyleSheet.create
  container:
    flex: 1
    paddingHorizontal: 32
    backgroundColor: 'white'

  message:
    marginTop: 32
    textAlign: 'justify'

  error:
    marginTop: 8
    textAlign: 'justify'
    color: lightRed

  phoneContainer:
    marginTop: 16
    marginLeft: -24
    flexDirection: 'row'
    alignItems: 'center'

  codeContainer:
    marginTop: 16
    flexDirection: 'row'
    alignItems: 'center'
    alignSelf: 'center'

  nationality:
    marginVertical: 8
    marginHorizontal: 6

  buttonContainer:
    marginTop: 8

  name:
    alignSelf: 'stretch'
    height: 60
    fontSize: 22

  phone:
    flex: 1
    height: 60
    fontSize: 22

  code:
    height: 60
    width: 100
    fontSize: 22
    textAlign: 'center'

  resendContainer:
    flexDirection: 'row'
    justifyContent: 'space-around'

  spinner:
    left: 8

  gender:
    marginTop: 8
    flexDirection: 'row'
    justifyContent: 'center'

  female:
    marginLeft: 32

  age:
    height: 60
    fontSize: 22
    alignSelf: 'stretch'


module.exports.extra =
  raisedButton:
    textColor: '#ffffff'
    backgroundColor: '#6B9297'

  textButton:
    textColor: '#6B9297'
