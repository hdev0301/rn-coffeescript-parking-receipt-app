{connect} = require 'react-redux'
{Actions: RouteActions} = require 'react-native-router-flux'
Screen = require './screen'
{getBonuses, bonusPoints} = require '../../libs/bonuses'
showScanReceipt = require '../../libs/show-scan-receipt'


mapStateToProps = (state) ->
  bonuses = getBonuses(state)

  bonuses: bonuses.toJS()
  points: bonusPoints(bonuses)
  onScanReceipt: showScanReceipt
  registered: state.user.auth.get('token')?
  onSignUp: RouteActions.signUp


module.exports = connect(mapStateToProps)(Screen)
