{connect} = require 'react-redux'
{Actions: RouteActions} = require 'react-native-router-flux'
Screen = require './screen'
{getBonuses, bonusPoints} = require '../../libs/bonuses'


mapStateToProps = (state) ->
  bonuses = getBonuses(state)
  phone = state.user.info.get('phone')
  registered = state.user.auth.get('token')?

  phone: phone
  registered: registered
  bonuses: bonuses.take(5).toJS()
  points: bonusPoints(bonuses)
  onMoreBonuses: RouteActions.bonusList
  onSignUp: RouteActions.signUp


module.exports = connect(mapStateToProps)(Screen)
