{connect} = require 'react-redux'
Toolbar = require './component'
{toolbarSearch} = require 'src/redux/actions'


mapStateToProps = (state) ->
  show: !state.route.get('hideToolbar')
  isRoot: state.route.get('isRoot')
  hasSearch: state.route.get('hasSearch')
  title: state.route.get('title')
  showSearch: state.app.get('toolbarSearchShow')


mapDispatchToProps = (dispatch) ->
  onSearch: (text) ->
    dispatch(toolbarSearch.text(text))

  onShowSearch: ->
    dispatch(toolbarSearch.show(yes))

  onHideSearch: ->
    dispatch(toolbarSearch.show(no))
    dispatch(toolbarSearch.text(null))


module.exports = connect(mapStateToProps, mapDispatchToProps)(Toolbar)
