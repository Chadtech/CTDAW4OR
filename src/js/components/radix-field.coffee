# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'

# DOM
{ div, input } = Himesama.DOM


module.exports = Radix = Himesama.createClass

  needs: [ 'rowRadix' ]

  handle: (event) ->
    rr = parseInt event.target.value
    @setState rowRadix: rr if rr> 1

  render: ->

    radix = @state.rowRadix
    radix = 'radix' unless radix

    input
      className:      'field'
      placeholder:    'row radix'
      event:          input: @handle
      value:          radix
    