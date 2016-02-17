# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM


module.exports = Himesama.createClass

  handle: ->
    {ri,key} = @attributes
    ri++
    {sheets} = @state
    si       = @state[key]
    s        = sheets[si]
    nr       = []
    l        = s[0].length
    _.times l, (i) => nr.push ''
    sheets[si].splice ri, 0, nr
    @setState sheets: sheets

  render: ->
    input
      className:      'nullButton add tiny'
      type:           'submit'
      event:          click: @handle
      value:          'v'