{format: formatUrl} = require 'url'
{Linking, Platform} = require 'react-native'


openUrl = (url) ->
  Linking.canOpenURL(url).then (supported) ->
    if supported
      Linking.openURL(url)


openMap = ->
  switch Platform.OS
    when 'android' then openMapAndroid(arguments...)
    when 'ios' then openMapIOS(arguments...)


openMapIOS = (location, route=no) ->
  query = {}

  query.ll = "#{location.lat},#{location.long}"
  query.q = location.label
  query.z = 11

  openUrl formatUrl
    protocol: 'http'
    host: 'maps.apple.com'
    query: query


openMapAndroid = (location, route=no) ->
  query = {}

  if location
    if location.long and location.lat
      query.q = "#{location.lat},#{location.long}"
      if not route then query.q += "(#{location.label})"
    else
      query.q = location

  protocol = if route then 'google.navigation' else 'geo'
  openUrl formatUrl {protocol, query}


module.exports = {
    openUrl
    openMap
}
