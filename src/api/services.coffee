{convertDate} = require './redux/utils'
convertRaffle = require './redux/raffles/convert'
convertConfig = require './redux/config/convert'


convertCreatedAt = (items) ->
  convertDate(items, '_createdAt', 'date')


DefaultActions = [
  {name: 'found', convert: convertCreatedAt}
  {name: 'created', isEvent: yes, convert: convertCreatedAt}
  {name: 'updated', isEvent: yes, convert: convertCreatedAt}
  {name: 'patched', isEvent: yes, convert: convertCreatedAt}
  {name: 'removed', isEvent: yes, convert: convertCreatedAt}
]


RaffleActions = [
  {name: 'found', convert: convertRaffle}
  {name: 'created', isEvent: yes, convert: convertRaffle}
  {name: 'updated', isEvent: yes, convert: convertRaffle}
  {name: 'patched', isEvent: yes, convert: convertRaffle}
  {name: 'removed', isEvent: yes, convert: convertRaffle}
]

ConfigActions = [
  {name: 'found', convert: convertConfig}
  {name: 'created', isEvent: yes, convert: convertConfig}
  {name: 'updated', isEvent: yes, convert: convertConfig}
  {name: 'patched', isEvent: yes, convert: convertConfig}
  {name: 'removed', isEvent: yes, convert: convertConfig}
]


module.exports = [
  name: 'store/places'
  initialUpdate: yes
  actions: DefaultActions
,
  name: 'store/categories'
  initialUpdate: yes
  actions: DefaultActions
,
  name: 'dining/places'
  initialUpdate: yes
  actions: DefaultActions
,
  name: 'dining/categories'
  initialUpdate: yes
  actions: DefaultActions
,
  name: 'promo/events'
  initialUpdate: yes
  actions: DefaultActions
,
  name: 'promo/offers'
  initialUpdate: yes
  actions: DefaultActions
,
  name: 'bonuses'
  initialUpdate: yes
  requireAuth: yes
  actions: DefaultActions
,
  name: 'raffles'
  initialUpdate: yes
  actions: RaffleActions
,
  name: 'tickets'
  initialUpdate: yes
  requireAuth: yes
  actions: DefaultActions
,
  name: 'parking'
  initialUpdate: yes
  actions: DefaultActions
,
  name: 'about'
  initialUpdate: yes
  actions: DefaultActions
,
  name: 'config'
  initialUpdate: yes
  actions: ConfigActions
,
  name: 'users'
  requireAuth: yes
  actions: [
    {name: 'updated', isEvent: yes, reduxAction: 'user.info.updated'}
    {name: 'patched', isEvent: yes, reduxAction: 'user.info.updated'}
  ]
]
