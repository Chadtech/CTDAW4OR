# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ el }   = Himesama

# DOM
div   = el 'div'
input = el 'input'


module.exports = DropDown = (content) ->

  div null,
    input
      className:  'nullButton'
      type:       'submit'
      value:      content
