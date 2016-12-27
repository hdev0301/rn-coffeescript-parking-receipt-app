Share = require 'react-native-share'


share = (title, description, image, link) ->
  if not link then return

  content =
    title: "Share to friends"
    url: link
    message: title

  Share.open(content).catch =>


module.exports = share
