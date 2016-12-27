{Actions: RouteActions} = require 'react-native-router-flux'
{connect} = require 'react-redux'
Screen = require './screen'
showScanReceipt = require '../../libs/show-scan-receipt'


Links =
  stores: 'storeCats'
  dining: 'diningCats'
  events: 'events'
  offers: 'offers'
  map: 'map'
  scanReceipt: 'scanReceipt'


mapStateToProps = (state) ->
  registered = state.user.auth.get('token')?
  banners = state.promo.offers
    .map (banner) -> banner.set('type', 'offers')
    .concat (
      state.promo.events
        .map (banner) -> banner.set('type', 'events')
    )
    .filter (banner) -> banner.get('showOnMain')

  storePlaces: state.store.places
  diningPlaces: state.dining.places
  banners: banners.toList().toJS()

  onLinkClick: (id) ->
    if id is 'scanReceipt'
      if not registered
        return RouteActions.bonusList()

      return showScanReceipt()

    screen = Links[id]
    RouteActions[screen]?()

  onBannerSelect: (id) ->
    banner = banners.get(id)
    title = banner?.get('title')
    if browserLink = banner?.get('browserLink')
      userId = state.user.info.get('id')
      browserLink = browserLink.replace('{USER_ID}', userId)
      RouteActions.browser(title: title, source: uri: browserLink)
    else
      promoType = banner.get('type')
      RouteActions.offer({promoType, id, title})


  onSearchSelect: (id, type) ->
    title = state[type].places.get(id)?.get('name')
    RouteActions.place(placeType: type, id: id, title: title)


module.exports = connect(mapStateToProps)(Screen)
