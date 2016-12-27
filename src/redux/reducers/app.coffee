{LOAD: StorageLoaded} = require 'redux-storage'
{handleActions} = require 'redux-actions'
Immutable = require 'immutable'
{ToolbarSearch, ApiInitialized, ApiSending} = require '../types'
{setter} = require './utils'


Reducers =
  "#{ToolbarSearch.Show}": setter('toolbarSearchShow')
  "#{ToolbarSearch.Text}": setter('toolbarSearchText')
  "#{ApiInitialized}": setter('api')
  "#{StorageLoaded}": setter(storageLoaded: yes)
  "#{ApiSending}": setter('apiSending')


InitialState = Immutable.Map
  toolbarSearchShow: no
  toolbarSearchText: null
  api: null
  apiSending: no
  storageLoaded: no


module.exports = handleActions(Reducers, InitialState)
