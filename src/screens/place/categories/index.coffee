{Component} = React = require 'react'
{connect} = require 'react-redux'
{Actions: RouteActions} = require 'react-native-router-flux'
SearchScreen = require '../../_common/search-screen'
Screen = require './screen'


module.exports = (placeType) ->

  mapStateToProps = (state) ->
    categories = state[placeType].categories

    categoriesProp = categories
      .sortBy (category) -> category.get('priority')
      .toList()
      .toJS()

    categories: categoriesProp
    places: state[placeType].places
    searchText: state.app.get('toolbarSearchText')

    onSelect: (id) ->
      title = categories.get(id)?.get('title')
      RouteActions.placeList(placeType: placeType, category: id, title: title)

    onSearchSelect: (id) ->
      title = state[placeType].places.get(id)?.get('name')
      RouteActions.place(placeType: placeType, id: id, title: title)


  connect(mapStateToProps) class extends Component
    @hasSearch: yes


    render: ->
      `<SearchScreen search={this._search} onSelect={this._searchSelect}>
        <Screen {...this.props} />
      </SearchScreen>`


    _search: (text) =>
      if not text
        return []

      text = text.toLowerCase()

      _filterPlace = (place) ->
        place.get('name').toLowerCase().includes(text) ||
        place.get('categories')?.some (category) -> category.toLowerCase().includes(text) ||
        place.get('tags')?.some (tag) -> tag.toLowerCase().includes(text) ||
        place.get('phone')?.includes(text) ||
        place.get('site')?.includes(text)
        # TODO: description?

      @props.places
        .filter(_filterPlace)
        .map (place, id) ->
          id: id
          title: place.get('name')
          image: place.get('logo')
        .toList()
        .toJS()


    _searchSelect: (id) =>
      @props.onSearchSelect(id)
