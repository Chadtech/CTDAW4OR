# Dependencies
Himesama = require 'himesama'
{ DOM }   = Himesama

# DOM
{ div, p, input } = DOM


module.exports = DropRight = Himesama.createClass

  render: ->
    { rowIndex } = @attributes

    div null,
      input
        className:  'nullButton'
        type:       'submit'
        value:      rowIndex
