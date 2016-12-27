{ActivityIndicator, View, TouchableOpacity, Image} = require 'react-native'
{Component} = React = require 'react'
{default: Camera} = require 'react-native-camera'
FS = require 'react-native-fs'
Icon = require 'react-native-vector-icons/MaterialIcons'
Modal = require 'react-native-modalbox'
Button = require '../_common/button'
styles = require './styles'


class Screen extends Component
  state:
    image: null


  render: ->
    showPreview = @state.image?

    `<View style={styles.container}>
      <Camera
        ref={c => this.camera = c}
        captureTarget={Camera.constants.CaptureTarget.temp}
        captureQuality='medium'
        captureAudio={false}
        style={styles.capturePreview} />

      <TouchableOpacity onPress={this.takePicture} style={styles.capture}>
        <Icon name='photo-camera' size={48} color='white' style={styles.icon} />
      </TouchableOpacity>

      <Modal position='center' isOpen={showPreview} style={styles.modal}>
        <View style={styles.previewContainer}>
          <Image source={{uri: 'data:;base64,' + this.state.image}} style={styles.preview}></Image>
          <Button
            title={this.props.sending ? "Sending" : "Send"}
            disabled={this.props.sending}
            style={styles.button}
            onPress={this.send}
          >
            { this.props.sending &&
              <ActivityIndicator
                color='white'
                size='small'
                style={styles.spinner} />
            }
          </Button>
          <Button title="Take new" style={styles.button} onPress={this.takeNew} />
        </View>
      </Modal>
    </View>`


  takePicture: =>
    @camera.capture()
      .then ({path}) =>
        path = path.replace('file://', '')
        FS.readFile(path, 'base64').then (base64) =>
          @setState(image: base64)
      .catch (e) -> console.error(e)


  send: =>
    @props.onSend?(@state.image)


  takeNew: =>
    @setState(image: null)


module.exports = Screen
