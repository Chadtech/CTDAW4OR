# Dependencies
Himesama = require './himesama'

# DOM
{ div, p } = Himesama.DOM

# Components
TrackerView = require './components/tracker-view'
HeaderBar   = require './components/header-bar'


module.exports = Main = Himesama.createClass

  render: ->
    div null,

      HeaderBar null

      div className:      'container',

        TrackerView()
        TrackerView()
