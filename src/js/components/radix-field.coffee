# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'

# DOM
{ div, input } = Himesama.DOM


module.exports = Radix = Himesama.createClass

  needs: [ 'radix' ]

  handle: (event) ->
    rr = parseInt event.target.value
    @setState radix: rr if rr> 1

  render: ->

    {radix} = @state
    radix   = 'radix' unless radix

    input
      className:      'field'
      placeholder:    'row radix'
      event:          input: @handle
      value:          radix
    