{Component} = React = require 'react'
{ListView} = require 'react-native'
{default: ImageCarousell} = require 'src/libs/ImageCarousell'


class Banners extends Component
  constructor: (props) ->
    super
    dataSource = new ListView.DataSource(rowHasChanged: (r1, r2) => r1 isnt r2)
    images = props.items.map (item) -> uri: item.image, id: item.id
    this.state.images = dataSource.cloneWithRows(images)


  componentWillMount: ->
    this.timerId = setInterval(@changePage, 4000)


  componentWillUnmount: ->
    clearInterval(this.timerId)


  state:
    page: 0


  render: ->
    `<ImageCarousell
      dataSource={this.state.images}
      showPreview={false}
      height={240}
      initialIndex={this.state.page}
      style={{backgroundColor: '#f5f5f3'}}
      onPress={(id) => this.select(id)} />`


  changePage: =>
    page = @state.page + 1
    if page >= @props.items.length
      page = 0
    @setState({page})


  select: (id) =>
    if not id then return
    @props.onSelect?(id)


module.exports = Banners
