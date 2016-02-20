# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM


module.exports = Himesama.createClass

  handle: ->
    {ri,key}  = @attributes
    {sheets}  = @state
    {offsets} = @state
    { x, y }  = offsets[key]
    ri       += y
    si        = @state[key]
    sheets[si].splice ri, 1
    @setState sheets: sheets

  render: ->
    input
      className:      'nullButton delete tiny'
      type:           'submit'
      event:          click: @handle
      value:          'X'