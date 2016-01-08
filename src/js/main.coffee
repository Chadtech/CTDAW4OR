# Dependencies
Himesama = require 'himesama'
{ el }   = Himesama

# DOM
p   = el 'p'
div = el 'div'

Tracker = require './components/tracker'

module.exports = Main = Himesama.Component

  render: ->

    div className: 'container',
      Tracker()
      Tracker()
      # div className: 'tracker'
      # Tracker