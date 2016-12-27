{connect} = require 'react-redux'
Screen = require './screen'
{toolbarSearch} = require 'src/redux/actions'


mapStateToProps = (state) ->
  show: state.app.get('toolbarSearchShow')
  text: state.app.get('toolbarSearchText')


mapDispatchToProps = (dispatch) ->
  onOverlayPress: -> dispatch(toolbarSearch.show(no))


module.exports = connect(mapStateToProps, mapDispatchToProps)(Screen)
