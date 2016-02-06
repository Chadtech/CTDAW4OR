# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'

# DOM
{ div, input } = Himesama.DOM


module.exports = Radix = Himesama.createClass

  needs: [ 'rowRadix' ]

  handle: (event) ->
    rowRadix = parseInt event.target.value
    if rowRadix > 1
      @setState rowRadix: rowRadix

  render: ->

    radix = @state.rowRadix
    radix = 'radix' unless radix

    input
      className:      'field'
      placeholder:    'row radix'
      event:          input: @handle
      value:          radix
    