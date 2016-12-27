if window?.navigator.toString() is '[object Object]'
  window.navigator = userAgent: 'ReactNative'

io = require 'socket.io-client/socket.io'
feathers = require 'feathers/client'
socketio = require 'feathers-socketio/client'
authentication = require 'feathers-authentication/client'
hooks = require 'feathers-hooks'
DeviceInfo = require 'react-native-device-info'


UsersService = 'users'
ReceiptService = 'receipts'
TicketService = 'tickets'


class Api
  constructor: (server) ->
    options = transports: ['websocket'], forceNew: yes
    socket = io(server, options)
    @app = feathers()
      .configure(socketio(socket, timeout: 10000))
      .configure(hooks())
      .configure(authentication())


  getServiceData: (name) =>
    @app.service(name).find()

    
  subscribeService: (name, events, onEvent) =>
    service = @app.service(name)
    
    events.map (event) ->
      service.on event, (data) ->
        onEvent(name, event, data)


  signUp: (info) =>
    deviceId = DeviceInfo.getUniqueID()
    info = Object.assign({deviceId}, info)
    @_userService().create(info)


  verify: (phone, code) =>
    deviceId = DeviceInfo.getUniqueID()
    @_userService().create({phone, deviceId, code})


  authenticate: (token) =>
    @app.authenticate({type: 'token', token})


  authenticateByPhone: (phone) =>
    device = DeviceInfo.getUniqueID()
    @app.authenticate({type: 'local', phone, device})


  uploadReceipt: (base64) =>
    @app.service(ReceiptService).create(image: base64)


  buyRaffleTicket: =>
    @app.service(TicketService).create({})


  _userService: =>
    @app.service(UsersService)


module.exports = Api
