{connect} = require 'react-redux'
{Actions: RouteActions} = require 'react-native-router-flux'
Screen = require './screen'
Actions = require 'src/redux/actions'
{getBonuses, bonusPoints} = require '../../libs/bonuses'


TicketPrice = 100
DefaultRaffleText = """
-Download this app and get a coupon from Mall Information Desk and enter our daily raffle.
-Purchase from any Bawadi Mall stores, bring your receipt to Information Desk and get a chance to win our daily prize of AED3000 worth of Bawadi Mall Gift Vouchers that are redeemable at any of the outlets in the mall.
Raffle draw will be held daily at 9 PM.
"""


mapStateToProps = (state) ->
  points = bonusPoints(getBonuses(state))
  description = state.config.get('raffleText')?.get('value') or DefaultRaffleText

  activeRaffle = state.raffles
    .filter (raffle) -> raffle.get('active')
    .sortBy (raffle) -> -raffle.get('to')
    .first()?.toJS()

  if activeRaffle
    ticketCount = state.tickets
      .filter (ticket) -> ticket.get('raffle') is activeRaffle.id
      .size
  else
    ticketCount = 0

  points: points
  ticketCount: ticketCount
  ticketPrice: TicketPrice
  enoughPoints: points >= TicketPrice
  activeRaffle: activeRaffle
  onGetBonuses: RouteActions.bonusList
  description: description


mapDispatchToProps = (dispatch) ->
  onBuyTicket: ->
    dispatch(Actions.bonuses.buyTicket())


module.exports = connect(mapStateToProps, mapDispatchToProps)(Screen)
