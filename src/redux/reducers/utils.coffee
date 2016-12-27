isObjectLike = require 'lodash.isobjectlike'


setter = (property, extra) ->
  (state, action) ->
    if isObjectLike(property)
      [extra, property] = [property, null]
    
    if extra
      state = state.merge(extra)
      
    if property
      state = state.set(property, action.payload)

    return state


module.exports = {
  setter
}
