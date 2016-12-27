devTools = require 'remote-redux-devtools'
{createStore, applyMiddleware, compose} = require 'redux'
storage = require 'redux-storage'
{default: createSagaMiddleware} = require 'redux-saga'
{default: createStorageEngine} = require 'redux-storage-engine-reactnativeasyncstorage'
{default: filter} = require 'redux-storage-decorator-filter'
{default: immutableJsMerger} = require 'redux-storage-merger-immutablejs/src'
reducer = require './reducers'


configureStore = ->
  engine = createStorageEngine('db')
  engine = filter engine, [
    'store'
    'dining'
    'promo'
    ['user', 'info']
    ['user', 'auth', 'codeSent']
    ['user', 'auth', 'token']
  ]

  storageMiddleware = storage.createMiddleware(engine)
  sagaMiddleware = createSagaMiddleware()
  reducer = storage.reducer(reducer, immutableJsMerger)

  middleware = applyMiddleware(sagaMiddleware, storageMiddleware)
  enhancer = compose(middleware, devTools())

  store = createStore(reducer, enhancer)
  store.runSaga = sagaMiddleware.run

  load = storage.createLoader(engine)
  load(store)

  return store


module.exports = configureStore
