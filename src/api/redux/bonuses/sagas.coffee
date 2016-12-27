{Alert} = require 'react-native'
{Actions: RouteActions} = require 'react-native-router-flux'
{takeEvery, effects: {call, select, put}} = require 'redux-saga'
Bonuses = require './types'
{getApi, getCurrentScreen} = require '../utils'
{apiSending} = require 'src/redux/actions'


newBonus = (action) ->
  api = yield select(getApi)
  base64 = action.payload

  try
    yield put(apiSending(yes))
    yield call(api.uploadReceipt, base64)
    yield put(apiSending(no))

    Alert.alert(
      "Thank you!"
      "You will get bonus points when we will check your receipt"
      [text: "OK"]
    )

    screen = yield select(getCurrentScreen)
    if screen is 'scanReceipt'
      try RouteActions.pop() catch

  catch error
    # TODO: token expired
    yield put(apiSending(no))

    Alert.alert(
      "Something went wrong :("
      "Please check your internet connection or try to restart application"
      [text: "OK"]
    )


buyRaffleTicket = ->
  api = yield select(getApi)

  try
    yield call(api.buyRaffleTicket)
    Alert.alert(
      "Congratulations!"
      "You have successfully get raffle ticket"
      [text: "OK"]
    )

  catch error
    # TODO: token expired
    Alert.alert(
      "Something went wrong :("
      "Please check your internet connection or try to restart application"
      [text: "OK"]
    )


module.exports = -> yield [
  takeEvery(Bonuses.New, newBonus)
  takeEvery(Bonuses.BuyTicket, buyRaffleTicket)
]
