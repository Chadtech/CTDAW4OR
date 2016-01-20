# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'
{ DOM }  = Himesama

# DOM
{ div, input } = DOM

# Components


module.exports = Open = Himesama.createClass

  render: ->

    input
      className:      'option-button'
      type:           'submit'
      value:          'save'
  