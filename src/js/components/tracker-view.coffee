# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM
{ row, column }   = require './ct-dom'

# Components
Tracker = require './tracker'
Sheets  = require './sheet-selections'


module.exports = Himesama.createClass

  render: ->
    { tn } = @attributes
    { ti } = @state[tn]

    payload     = {}
    payload[tn] = ti
    payload.key = tn
    need        = [ tn ]

    div className: 'tracker',
      Sheets  payload, need
      Tracker payload, need