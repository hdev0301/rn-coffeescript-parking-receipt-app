React = require 'react'
{WebView} = require 'react-native'
{Router, Scene} = require 'react-native-router-flux'
screens = require './screens'


module.exports = (reducerCreate, registered) ->
  `<Router createReducer={reducerCreate}>
    <Scene key='root' hideNavBar={true}>
      <Scene
        key='main'
        component={screens.Main}
        hideNavBar={true} />
      <Scene
        key='storeCats'
        component={screens.Place.Categories('store')}
        hideNavBar={true}
        title="Stores" />
      <Scene
        key='diningCats'
        component={screens.Place.Categories('dining')}
        hideNavBar={true}
        title="Dining" />
      <Scene
        key='placeList'
        component={screens.Place.List}
        hideNavBar={true} />
      <Scene
        key='place'
        component={screens.Place.Detail}
        hideNavBar={true} />
      <Scene
        key='offers'
        component={screens.Promo.List('offers')}
        hideNavBar={true}
        title="Offers" />
      <Scene
        key='events'
        component={screens.Promo.List('events')}
        hideNavBar={true}
        title="Events" />
      <Scene
        key='offer'
        component={screens.Promo.Detail}
        hideNavBar={true} />
      <Scene
        key='parking'
        component={screens.Parking}
        hideNavBar={true}
        title="Parking" />
      <Scene
        key='profile'
        component={screens.Profile}
        hideNavBar={true}
        title="My profile" />
      <Scene
        key='bonusList'
        component={screens.Bonuses}
        hideNavBar={true}
        title="Bonus points" />
      <Scene
        key='signUp'
        component={screens.SignUp}
        initial={!registered}
        direction='vertical'
        hideNavBar={true}
        hideToolbar={true}
        title="Sign up" />
      <Scene
        key='scanReceipt'
        component={screens.ScanReceipt}
        hideNavBar={true}
        title="Scan receipt" />
      <Scene
        key='raffle'
        component={screens.Raffle}
        hideNavBar={true}
        title="Raffle" />
      <Scene
        key='about'
        component={screens.About}
        hideNavBar={true}
        title="About" />
      <Scene
        key='browser'
        component={WebView}
        hideNavBar={true} />
    </Scene>
  </Router>`
