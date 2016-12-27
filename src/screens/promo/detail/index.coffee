{connect} = require 'react-redux'
Screen = require './screen'


mapStateToProps = (state, props) ->
  promos = state.promo[props.promoType]
  promo = promos.get(props.id)

  promo: promo.toJS()


module.exports = connect(mapStateToProps)(Screen)
