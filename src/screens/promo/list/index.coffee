{connect} = require 'react-redux'
{Actions: RouteActions} = require 'react-native-router-flux'
share = require 'src/libs/share'
Screen = require './screen'


module.exports = (promoType) ->
  mapStateToProps = (state) ->
    promos = state.promo[promoType]
      .sortBy (item) -> -item.get('date').getTime()

    promos: promos.toList().toJS()

    onSelect: (id) ->
      promo = promos.get(id)
      title = promo?.get('title')
      if browserLink = promo?.get('browserLink')
        userId = state.user.info.get('id')
        browserLink = browserLink.replace('{USER_ID}', userId)
        RouteActions.browser(title: title, source: uri: browserLink)
      else
        RouteActions.offer(promoType: 'offers', id: id, title: title)

    onShare: (id) ->
      promo = promos.get(id)
      title = promo.get('title')
      description = promo.get('description')
      image = promo.get('image')
      link = promo.get('shareLink')

      share(title, description, image, link)

  connect(mapStateToProps)(Screen)
