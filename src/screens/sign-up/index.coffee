{connect} = require 'react-redux'
{PhoneNumberFormat: PNF, PhoneNumberUtil: PhoneUtil} = require 'google-libphonenumber'
{
  Actions: RouteActions
  ActionConst: RouteType
} = require 'react-native-router-flux'
{user: auth: authActions} = require 'src/redux/actions'
Screen = require './screen'


phoneUtils = PhoneUtil.getInstance()
token = null


mapStateToProps = (state) ->
  auth = state.user.auth
  info = state.user.info
  route = state.route

  close = ->
    if route.get('isRoot')
      RouteActions.main(type: RouteType.REPLACE)
    else
      try RouteActions.pop() catch

  newToken = auth.get('token')
  if newToken isnt token # FIXME: hack
    token = newToken
    close()
    return {}

  processing: auth.get('processing')
  codeSent: auth.get('codeSent')
  phone: info.get('phone')
  age: info.get('age')
  gender: info.get('gender')
  error: auth.get('signUpError')
  onSkip: close


mapDispatchToProps = (dispatch) ->
  sendCode: (info) ->
    phone = info.phone

    try
      phone = phoneUtils.parse(phone)
      if not phoneUtils.isValidNumber(phone)
        throw new Error("Invalid phone. Phone must be in international format (971 50 1234567)")
    catch e
      dispatch(authActions.signUpError(e.message))
      return

    dispatch(authActions.signUp(info))

  verify: (phone, code) ->
    dispatch(authActions.verify({phone, code}))

  clearError: ->
    dispatch(authActions.signUpError(null))

  clearSentState: ->
    dispatch(authActions.codeSent(no))


module.exports = connect(mapStateToProps, mapDispatchToProps)(Screen)
