{
  View
  Image
  TextInput
  TouchableOpacity
  Text
  Platform
} = require 'react-native'
{Component} = React = require 'react'
Icon = require 'react-native-vector-icons/MaterialIcons'
NavigationBar = require 'react-native-navbar'
styles = require './styles'
gstyles = require 'src/styles'


class Toolbar extends Component
  constructor: ->
    @state = searchText: ""


  componentWillReceiveProps: (nextProps) ->
    if not nextProps.showSearch
      @search("")


  render: ->
    if not @props.show
      return null

    `<NavigationBar
      title={this.title()}
      leftButton={this.leftButton()}
      rightButton={this.rightButton()}
      style={styles.toolbar} />`


  leftButton: =>
    showMenuIcon = @props.isRoot and not @props.showSearch
    iconName = if showMenuIcon then 'menu' else 'arrow-back'

    `<TouchableOpacity onPress={this.iconClicked} style={styles.button}>
      <Icon name={iconName} size={24} style={gstyles.gray} />
    </TouchableOpacity>`


  rightButton: =>
    showSearchIcon = not @props.showSearch or @state.searchText
    if not @props.hasSearch or not showSearchIcon
      return

    showClearIcon = @state.searchText
    iconName = if showClearIcon then 'clear' else 'search'

    `<TouchableOpacity onPress={this.actionSelected} style={styles.button}>
      <Icon name={iconName} size={24} style={gstyles.gray} />
    </TouchableOpacity>`


  title: =>
    if @props.showSearch
      return @getSearch()

    if @props.title
      return @getTitle()

    @getLogo()


  iconClicked: =>
    if @props.showSearch
      return @props.onHideSearch?()

    if @props.isRoot
      return @props.onMenu?()

    @props.onBack?()


  actionSelected: =>
    if @props.showSearch
      @setState(searchText: "")
      @props.onSearch?("")
    else
      @props.onShowSearch?()


  search: (text) =>
    @setState(searchText: text)
    @props.onSearch?(text)


  getTitle: =>
    style = if Platform.OS is 'ios' then styles.titleIOS else styles.title

    `<Text style={[gstyles.gray, style]} numberOfLines={1}>
      {this.props.title.toUpperCase()}
    </Text>`


  getLogo: ->
    style = if Platform.OS is 'ios' then styles.logoIOS else styles.logo
    `<Image source={require('src/res/images/logo.png')} style={style} />`


  getSearch: =>
    `<TextInput
      ref={(c) => this.searchField = c}
      onChangeText={this.search}
      value={this.state.searchText}
      autoFocus={true}
      onSubmitEditing={() => this.searchField.blur()}
      placeholder="Search"
      style={styles.searchField} />`


module.exports = Toolbar
