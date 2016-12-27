{Alert} = require 'react-native'
{takeLatest, effects: {call, put, select, take, fork}} = require 'redux-saga'
{LOAD: StorageLoaded} = require 'redux-storage'
Auth = require './types'
{user} = require 'src/redux/actions'
{getApi} = require '../../utils'


getToken = (state) ->
  state.user.auth.get('token')


getPhone = (state) ->
  state.user.info.get('phone')


authenticate = ->
  yield take(StorageLoaded)

  if not token = yield select(getToken)
    return

  phone = yield select(getPhone)

  yield from authenticateByTokenOrPhone(token, phone)


signUp = (action) ->
  api = yield select(getApi)
  info = action.payload

  yield put(user.auth.codeSent(no))
  yield put(user.auth.processing(yes))
  yield put(user.info.updated(info))

  try
    result = yield call(api.signUp, info)
    yield put(user.auth.codeSent(yes))

    if token = result?.token
      yield put(user.auth.tokenReceived(token))
      yield from authenticateByTokenOrPhone(token)

  catch e
    error = errorMessage(e)
    yield put(user.auth.signUpError(error))

  yield put(user.auth.processing(no))


verify = (action) ->
  api = yield select(getApi)
  {phone, code} = action.payload

  yield put(user.auth.processing(yes))

  try
    result = yield call(api.verify, phone, code)

    if token = result?.token
      yield put(user.auth.tokenReceived(token))
      yield from authenticateByTokenOrPhone(token)

      Alert.alert(
        "Congratulations!"
        "You just got 100 bonus points for registering with us!
        You can use it for daily raffle draw or keep for future prizes.
        Keep visiting Bawadi Mall app for more fun!"
        [text: "OK"]
      )

  catch e
    error = errorMessage(e)
    yield put(user.auth.signUpError(error))

  yield put(user.auth.processing(no))


authenticateByTokenOrPhone = (token, phone) ->
  api = yield select(getApi)

  try
    result = yield call(api.authenticate, token)
    yield put(user.auth.signedIn(yes))

    if info = result?.data
      yield put(user.info.updated(info))

  catch
    if not phone
      yield put(user.auth.tokenReceived(null))
      return

    result = yield call(api.authenticateByPhone, phone)

    if token = result?.token
      yield put(user.auth.tokenReceived(token))
      yield from authenticateByTokenOrPhone(token)


errorMessage = (e) ->
  e.message or "Something went wrong. Please try again later."


module.exports = -> yield [
  takeLatest(Auth.SignUp, signUp)
  takeLatest(Auth.Verify, verify)
  fork(authenticate)
]
