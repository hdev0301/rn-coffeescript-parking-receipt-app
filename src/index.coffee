crashlytics = require 'react-native-fabric-crashlytics'
crashlytics.init()

# FIXME: https://github.com/feathersjs/feathers-errors/issues/29
require 'babel-polyfill'

{Component} = React = require 'react'
{AppRegistry} = require 'react-native'
{Provider: ReduxProvider} = require 'react-redux'
configureStore = require './redux/store'
rootSaga = require './api/redux/sagas'
Api = require './api/index'
{apiInitialized} = require './redux/actions'
GUI = require './gui'


Server = 'http://bawadi-server.eu-central-1.elasticbeanstalk.com'
#Server = 'http://192.168.56.1:8082'
#Server = 'http://localhost:8082'


api = new Api(Server)
store = configureStore()
store.runSaga(rootSaga)
store.dispatch(apiInitialized(api))


class App extends Component
  render: ->
    `<ReduxProvider store={store}>
      <GUI />
    </ReduxProvider>`


AppRegistry.registerComponent('Bawadi', -> App)
