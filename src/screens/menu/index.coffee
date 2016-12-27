React = require 'react'
{
  Actions: RouteActions
  ActionConst: RouteType
} = require 'react-native-router-flux'
Screen = require './screen'


MenuItems = [
  {title: "Main", id: 'main', icon: 'dashboard'}
  {title: "Stores", id: 'storeCats', icon: 'store'}
  {title: "Dining", id: 'diningCats', icon: 'local-dining'}
  {title: "Events", id: 'events', icon: 'event'}
  {title: "Offers", id: 'offers', icon: 'local-offer'}
#  {title: "Mall map", id: 'map', icon: 'map'}
  {title: "Parking", id: 'parking', icon: 'local-parking'}
  {title: "Raffle", id: 'raffle', icon: 'local-play'}
  {title: "My profile", id: 'profile', icon: 'account-circle'}
  {title: "About", id: 'about', icon: 'info-outline'}
]


class Menu extends Screen
  render: ->
    `<Screen onSelect={this.select} items={MenuItems} />`


  select: (id) =>
    @props.onSelect?()
    RouteActions[id]?(type: RouteType.REPLACE)


module.exports = Menu
