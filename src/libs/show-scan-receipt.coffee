{Actions: RouteActions} = require 'react-native-router-flux'
{Platform, PermissionsAndroid} = require 'react-native'


module.exports = ->
  if Platform.OS isnt 'android'
    return RouteActions.scanReceipt()

  PermissionsAndroid.requestPermission(PermissionsAndroid.PERMISSIONS.CAMERA)
    .then (granted) ->
      if not granted then return
      RouteActions.scanReceipt()
