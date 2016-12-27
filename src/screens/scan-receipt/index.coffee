{connect} = require 'react-redux'
{bonuses} = require 'src/redux/actions'
Screen = require './screen'


mapStateToProps = (state) ->
  sending: state.app.get('apiSending')


mapDispatchToProps = (dispatch) ->
  onSend: (base64) ->
    dispatch(bonuses.new(base64))


module.exports = connect(mapStateToProps, mapDispatchToProps)(Screen)
