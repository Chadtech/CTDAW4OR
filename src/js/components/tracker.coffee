# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM
{ row, column }   = require './ct-dom'

# Components
DropDown  = require './drop-down'
DropRight = require './drop-right'
Cell      = require './cell'


module.exports = Tracker = Himesama.createClass

  needs: [ 'sheets',  'rowRadix' ]

  render: ->
    {sheets} = @state
    {key}    = @attributes
    si       = @state[key]
    s        = sheets[si]

    columns = s.slice 0, 11
    columns = _.map columns, 
      (c, ci) ->
        column null,
          DropDown 
            key: key
            ci:  ci

    rows = s.slice 0, 37
    rows = _.map rows, (r, ri) =>

      cells = r.slice 0, 11
      cells = _.map cells, (c, ci) =>
        column null,
          Cell 
            ci:      ci
            ri:      ri
            key:     key
            content: c

      row null,
        column null,
          DropRight 
            key: key
            ri:  ri
        cells


    div className:            'container',
      row null, 
        column null,
          input
            className:        'nullButton'
            type:             'submit'
            value:            ''
        columns
      rows

