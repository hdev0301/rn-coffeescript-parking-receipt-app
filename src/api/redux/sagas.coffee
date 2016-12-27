{fork} = require 'redux-saga/effects'


module.exports = -> yield [
  fork(require './user/auth/sagas')
  fork(require './service/sagas')
  fork(require './bonuses/sagas')
]
