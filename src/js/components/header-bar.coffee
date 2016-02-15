# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'

# DOM
{ div, p, input } = Himesama.DOM

# Components
Open  = require './open-button'
Save  = require './save-button'
Radix = require './radix-field'


module.exports = HeaderBar = Himesama.createClass

  render: ->

    div className: 'header-bar',

      # Open()
      # Save()
      Radix()

