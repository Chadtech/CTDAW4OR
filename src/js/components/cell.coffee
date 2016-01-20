# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'
{ DOM }   = Himesama

# DOM
{ div, p, input } = DOM


module.exports = Cell = Himesama.createClass

  handle: (event) ->
    { ci, ri } = @attributes
    v = event.target.value
    @state.sheets[0][ri][ci] = v
    @setState sheets: @state.sheets

  render: ->
    { content } = @attributes

    className =  'cell'
    className += ' filled' if content

    input
      className:      className
      event:          input: @handle
      value:          content
