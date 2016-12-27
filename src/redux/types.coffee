merge = require 'lodash.merge'
ApiTypes = require 'src/api/redux/types'


Types =
  ToolbarSearch:
    Show: 'TOOLBAR_SEARCH_SHOW'
    Text: 'TOOLBAR_SEARCH_TEXT'

  Routed: 'ROUTED'
  ApiInitialized: 'API_INITIALIZED'
  ApiSending: 'API_SENDING'


module.exports = merge(ApiTypes, Types)
