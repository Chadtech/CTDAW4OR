# Dependencies
Himesama = require 'himesama'
{ DOM }   = Himesama

# DOM
{ div, p } = DOM

Tracker = require './components/tracker'

module.exports = Main = Himesama.createClass

  render: ->

    div className: 'container',
      Tracker()
      Tracker()
