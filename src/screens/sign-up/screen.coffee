{
  Text
  View
  TextInput
  WebView
  TouchableWithoutFeedback
  ActivityIndicator
  KeyboardAvoidingView
  ScrollView
} = require 'react-native'
{Component} = React = require 'react'
{Button} = require 'react-native-material-design'
Icon = require 'react-native-vector-icons/MaterialIcons'
ExtraIcon = require 'src/libs/extra-icons'
dismissKeyboard = require 'react-native-dismiss-keyboard'
{default: ModalPicker} = require 'react-native-modal-picker'
nationalities = require 'src/res/nationalities.json'
styles = require './styles'
gstyles = require 'src/styles'
{orange, gray} = require 'src/colors'


Gender =
  Male: 1
  Female: 2


class Screen extends Component
  state:
    phone: null
    age: ""
    code: null
    gender: null
    name: null
    area: null
    nationality: null



  constructor: (props) ->
    super
    @state = Object.assign @state,
      phone: props.phone?[1..]
      age: props.age?.toString() or ""
      gender: props.gender


  componentWillReceiveProps: (nextProps) ->
    @setState
      phone: nextProps.phone?[1..]
      age: nextProps.age?.toString() or ""
      gender: nextProps.gender


  render: ->
    if @props.codeSent
      screen = @renderVerify()
    else
      screen = @renderUserInfo()

    `<ScrollView style={styles.screen} bounces={false}>
      {screen}
    </ScrollView>`


  renderUserInfo: ->
    `<TouchableWithoutFeedback onPress={dismissKeyboard}>
      <KeyboardAvoidingView style={styles.container}>
        <Text style={[gstyles.gray, styles.message]}>Please enter your phone.
          We will send verificaction code via sms. Other fields are optional.
          You can help us to improve our service by specifying them.
        </Text>

        <View style={styles.phoneContainer}>
          <Icon name='add' size={24} style={[gstyles.gray, styles.phonePlus]} />
          <TextInput
            value={this.state.phone}
            onChangeText={this.setPhone}
            placeholder="971 50 1234567 *"
            keyboardType='phone-pad'
            onFocus={this.hideError}
            style={styles.phone} />
          { this.props.processing && <ActivityIndicator size='small' style={styles.spinner} /> }
        </View>

        <TextInput
          value={this.state.age}
          onChangeText={this.setAge}
          placeholder="Age"
          keyboardType='numeric'
          onFocus={this.hideError}
          style={styles.age} />

        <TextInput
          value={this.state.name}
          onChangeText={this.setName}
          placeholder="Name"
          onFocus={this.hideError}
          style={styles.name} />

        <TextInput
          value={this.state.area}
          onChangeText={this.setArea}
          placeholder="Area"
          onFocus={this.hideError}
          style={styles.name} />

        {this.createNationalitiesPicker()}

        <View style={styles.gender}>
          <ExtraIcon
            name='male'
            size={48}
            onPress={() => this.setGender(Gender.Male)}
            color={this.state.gender === Gender.Male ? orange : gray} />
          <ExtraIcon
            name='female'
            size={48}
            color={this.state.gender === Gender.Female ? orange : gray}
            onPress={() => this.setGender(Gender.Female)}
            style={styles.female} />
        </View>

        { this.props.error && <Text style={styles.error}>{this.props.error}</Text> }

        <View style={styles.buttonContainer}>
          <Button
            disabled={!this.state.phone || this.props.processing}
            onPress={this.sendCode}
            raised={true}
            overrides={styles.extra.raisedButton}
            text="SIGN UP" />
          <Button
            disabled={this.props.processing}
            onPress={this.skip}
            overrides={styles.extra.textButton}
            text="Register later" />
        </View>
      </KeyboardAvoidingView>
    </TouchableWithoutFeedback>`


  renderVerify: ->
    `<View style={styles.container}>
      <Text style={[gstyles.gray, styles.message]}>
        Verification code was sent to +{this.state.phone}.
        Try to resend if you will not get it in 3 minutes.
      </Text>

      <View style={styles.codeContainer}>
        <TextInput
          value={this.state.code}
          onChangeText={this.setCode}
          placeholder="1234"
          keyboardType='numeric'
          style={styles.code} />
        { this.props.processing && <ActivityIndicator size='small' style={styles.spinner} /> }
      </View>
      <Text style={styles.error}>{this.props.error}</Text>

      <View style={styles.buttonContainer}>
        <Button
          disabled={!this.state.code || this.props.processing}
          onPress={this.verify}
          raised={true}
          overrides={styles.extra.raisedButton}
          text="VERIFY" />

        <View style={styles.resendContainer}>
          <Button
            disabled={this.props.processing}
            onPress={this.sendCode}
            overrides={styles.extra.textButton}
            text="Resend" />
          <Button
            disabled={this.props.processing}
            onPress={this.clearSentState}
            overrides={styles.extra.textButton}
            text="Change number" />
          <Button
            disabled={this.props.processing}
            onPress={this.skip}
            overrides={styles.extra.textButton}
            text="Register later" />
        </View>
      </View>
    </View>`


  createNationalitiesPicker: =>
    data = nationalities.map (nationality) ->
      key = nationality.toLowerCase()
      {key, label: nationality}

    `<ModalPicker
      data={data}
      initValue="Select nationality"
      onChange={this.setNationality}
      style={styles.nationality} />`


  setNationality: ({key: nationality}) =>
    @setState({nationality})

    
  setPhone: (phone) =>
    @setState({phone})


  setCode: (code) =>
    @setState({code})


  setAge: (age) =>
    if not isNaN(age) and age.length < 4
      @setState({age})


  setName: (name) =>
    @setState({name})


  setArea: (area) =>
    @setState({area})


  setGender: (gender) =>
    @setState({gender})


  clearSentState: =>
    @props.clearSentState?()


  verify: =>
    @props.verify?(@getPhone(), this.state.code)


  sendCode: =>
    dismissKeyboard()
    info =
      phone: @getPhone()
      gender: @state.gender
      age: parseInt(@state.age)
      name: @state.name
      area: @state.area
      nationality: @state.nationality
    @props.sendCode?(info)


  getPhone: =>
    "+#{@state.phone}"


  skip: =>
    @props.onSkip?()


  hideError: =>
    @props.clearError?()


module.exports = Screen
