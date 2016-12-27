Immutable = require 'immutable'
{handleActions} = require 'redux-actions'
{setter} = require 'src/redux/reducers/utils'
Auth = require './types'


reducers =
  "#{Auth.Processing}": setter('processing')
  "#{Auth.CodeSent}": setter('codeSent', signUpError: no)
  "#{Auth.SignUpError}": setter('signUpError')
  "#{Auth.TokenReceived}": setter('token')
  "#{Auth.SignedIn}": setter('signedIn')


initialState = Immutable.Map
  processing: no
  codeSent: no
  signUpError: null
  token: null
  signedIn: no


module.exports = handleActions(reducers, initialState)
