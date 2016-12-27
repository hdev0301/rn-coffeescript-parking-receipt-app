{View, Image} = require 'react-native'
{Component} = React = require 'react'
SearchScreen = require '../_common/search-screen'
Banners = require './_common/banners'
HotLink = require './_common/hotlink'
styles = require './styles'


class HotLinks extends Component
  # TODO: to map()
  render: ->
    `<View style={styles.hotLinks}>
      <View style={styles.links}>
        <HotLink id='stores' title="Stores" icon='store' onClick={this.click} />
        <HotLink id='dining' title="Dining" icon='local-dining' onClick={this.click} />
        <HotLink id='offers' title="Offers" icon='local-offer' onClick={this.click} />
        <HotLink id='scanReceipt' title="Scan receipt" icon='photo-camera' onClick={this.click} />
      </View>
      <View style={styles.orangeLine} />
    </View>`


  click: (id) =>
    @props.onLinkClick?(id)
    
    
class Screen extends Component
  @hasSearch: yes


  render: ->
    `<SearchScreen search={this.search} onSelect={this.searchSelect}>
      <View style={styles.back}>
        <Banners items={this.props.banners} onSelect={this.bannerSelect} />
        <View style={styles.imageContainer}>
          <Image source={require('src/res/images/hearth.png')} />
        </View>
        <HotLinks onLinkClick={this.linkClick}/>
      </View>
    </SearchScreen>`


  linkClick: (id) =>
    @props.onLinkClick?(id)


  mapClick: =>
    @_linkClick('map')
    
    
  bannerSelect: (id) =>
    @props.onBannerSelect?(id)


  # search delegate
  search: (text) =>
    if not text
      return []

    text = text.toLowerCase()

    filterPlace = (place) ->
      place.get('name').toLowerCase().includes(text) ||
      place.get('categories')?.some (category) -> category.toLowerCase().includes(text) ||
      place.get('tags')?.some (tag) -> tag.toLowerCase().includes(text) ||
      place.get('phone')?.includes(text) ||
      place.get('site')?.includes(text)
      # TODO: description?

    placeToSearchItem = (type) ->
      (place, id) ->
        id: id: id, type: type
        title: place.get('name')
        image: place.get('logo')

    search = (places, type) ->
      places
        .filter(filterPlace)
        .map(placeToSearchItem(type))
        .toList()

    stores = search(@props.storePlaces, 'store')
    dining = search(@props.diningPlaces, 'dining')

    stores.concat(dining).toJS()


  searchSelect: ({id, type}) =>
    @props.onSearchSelect(id, type)


module.exports = Screen
