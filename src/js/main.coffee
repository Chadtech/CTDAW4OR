# Dependencies
Himesama = require './himesama'

# DOM
{ div, p } = Himesama.DOM

# Components
TrackerView = require './components/tracker-view'
HeaderBar   = require './components/header-bar'


module.exports = Main = Himesama.createClass

  render: ->
    { lefti, righti } = @state

    div null,
      # style:
      #   margin: '0 auto'
      #   width:  '50%'
      #   height: '100%' 
      HeaderBar null
      div className: 'container',

        TrackerView tn: 'lefti'
        TrackerView tn: 'righti'
