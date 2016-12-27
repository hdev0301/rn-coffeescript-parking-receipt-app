{handleActions} = require 'redux-actions'
Immutable = require 'immutable'
{Routed} = require '../types'


route = (state, action) ->
  navState = action.payload
  index = navState.index
  current = navState.children[index]

  isRoot = index is 0
  hasSearch = current.component.hasSearch
  title = current.title
  hideToolbar = current.hideToolbar

  state
    .set('name', current.name)
    .set('isRoot', isRoot)
    .set('hasSearch', hasSearch)
    .set('title', title)
    .set('hideToolbar', hideToolbar)


Reducers =
  "#{Routed}": route


InitialState = Immutable.Map
  name: null
  isRoot: yes
  hasSearch: yes
  title: ""
  hideToolbar: no


module.exports = handleActions(Reducers, InitialState)
