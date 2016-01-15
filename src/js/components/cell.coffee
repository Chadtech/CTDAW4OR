# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }   = Himesama

# DOM
{ div, p, input } = DOM


module.exports = Cell = Himesama.createClass

  handle: (event) ->
    { handle, ci, ri } = @attributes
    handle event.target.value, ci, ri

  render: ->
    { content } = @attributes

    className =  'cell'
    className += ' filled' if content

    input
      className:      className
      event:          input: @handle
      value:          content
