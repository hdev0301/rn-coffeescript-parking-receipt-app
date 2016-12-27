{connect} = require 'react-redux'
SocialNetworks = require './component'
colors = require 'src/colors'


mapStateToProps = (state) ->
  networks: [
    {name: "Facebook", icon: 'facebook', color: colors.facebook}
    {name: "Twitter", icon: 'twitter', color: colors.twitter, connected: yes}
  ]


module.exports = connect(mapStateToProps)(SocialNetworks)
