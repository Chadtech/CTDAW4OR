# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM


module.exports = Cell = Himesama.createClass

  handle: (event) ->
    {ci,ri,si} = @attributes
    { sheets } = @state
    v = event.target.value
    sheets[si][ri][ci] = v
    @setState sheets: sheets

  render: ->
    { content } = @attributes

    className  = 'cell'
    className += ' filled' if content

    input
      className: className
      event:     input: @handle
      value:     content
