# Dependencies
Himesama = require './himesama'
{ DOM }  = Himesama

# DOM
{ div, p } = DOM

# Tracker   = require './components/tracker'
TrackerView = require './components/tracker-view'
HeaderBar = require './components/header-bar'

module.exports = Main = Himesama.createClass

  render: ->
    div null,

      HeaderBar null

      div className:      'container',

        TrackerView()
        TrackerView()
        # Tracker null
        # Tracker null
