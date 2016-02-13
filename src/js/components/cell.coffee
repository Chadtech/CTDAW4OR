# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM


module.exports = Cell = Himesama.createClass

  # needs: [ 'sheets' ]

  handle: (event) ->
    {ci,ri,si,key} = @attributes
    # console.log key, si
    si = @state[key]
    # console.log 'si now', si
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
