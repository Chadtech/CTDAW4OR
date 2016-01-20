# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'
{ DOM }  = Himesama

# DOM
{ div, input } = DOM

# Components
Open  = require './open-button'
Save  = require './save-button'
Radix = require './radix-field'

module.exports = HeaderBar = Himesama.createClass

  render: ->

    div className: 'header-bar',

      Open null

      Save null

      Radix null