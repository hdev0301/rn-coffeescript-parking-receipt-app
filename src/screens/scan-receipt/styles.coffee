{StyleSheet} = require 'react-native'


module.exports = StyleSheet.create
  container:
    flex: 1

  capturePreview:
    flex: 1

  capture:
    position: 'absolute'
    height: 48
    bottom: 16
    left: 0
    right: 0
    alignItems: 'center'

  modal:
    backgroundColor: 'transparent'

  previewContainer:
    flex: 1
    marginHorizontal: 16
    marginVertical: 32
    padding: 16
    backgroundColor: 'white'

  preview:
    flex: 1
    
  button:
    marginTop: 16

  spinner:
    marginLeft: 16

  icon:
    backgroundColor: 'transparent'