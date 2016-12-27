{Component} = React = require 'react'
{Platform, StatusBar, BackAndroid} = require 'react-native'
{connect} = require 'react-redux'
{
  Actions: RouteActions
  Reducer: RouteReducer
} = require 'react-native-router-flux'
Actions = require './redux/actions'
Routes = require './routes'
DrawerLayout = require 'react-native-drawer-layout'
Toolbar = require './screens/_common/toolbar'
Menu = require './screens/menu'


class GUI extends Component
  constructor: (props) ->
    super
    @initRoutesIfShowGUI(props)


  componentDidMount: ->
    BackAndroid.addEventListener 'hardwareBackPress', =>
      if @props.isRoot and @props.currentRoute isnt 'main'
        RouteActions.main()
      else
        try RouteActions.pop() catch

    return yes


  componentWillReceiveProps: (nextProps) ->
    @initRoutesIfShowGUI(nextProps)


  render: ->
    if not @props.showGUI
      return null

    `<DrawerLayout
      drawerWidth={250}
      ref={c => this.drawer = c}
      renderNavigationView={() => <Menu onSelect={this.closeDrawer} />}
      onDrawerSlide={this.setStatusBarHiddenOnIOS}
    >
      <Toolbar onMenu={this.openDrawer} onBack={this.back} />
      {this.routes}
    </DrawerLayout>`


  back: ->
    try RouteActions.pop() catch


  openDrawer: =>
    @drawer.openDrawer()


  closeDrawer: =>
    @drawer.closeDrawer()


  setStatusBarHiddenOnIOS: (e) =>
    if Platform.OS isnt 'ios'
      return

    hidden = e.nativeEvent.offset > 0.3
    StatusBar.setHidden(hidden)


  initRoutesIfShowGUI: (props) =>
    if props.showGUI and not @routes
      @routes = Routes(props.routeReducerCreate, props.registered)


mapStateToProps = (state) ->
  isRoot: state.route.get('isRoot')
  currentRoute: state.route.get('name')
  showGUI: state.app.get('storageLoaded')
  registered: state.user.auth.get('token')?


mapDispatchToProps = (dispatch) ->
  routeReducerCreate: (params) ->
    defaultReducer = RouteReducer(params)
    (state, action) ->
      newState = defaultReducer(state, action)
      if action.type isnt 'RootContainerInitialAction'
        dispatch(Actions.routed(newState))
        dispatch(Actions.toolbarSearch.show(no))
        dispatch(Actions.toolbarSearch.text(null))
      return newState


module.exports = connect(mapStateToProps, mapDispatchToProps)(GUI)
