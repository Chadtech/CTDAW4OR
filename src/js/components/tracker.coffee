# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }   = Himesama

# DOM
{ div, p, input } = DOM
{ row, column } = require './ct-dom'

# Components
DropDown  = require './drop-down'
DropRight = require './drop-right'
Cell      = require './cell'


module.exports = Tracker = Himesama.createClass

  aaname: 'Tracker!!!'

  needs: [ 'sheet' ]

  handleCell: (value, ci, ri) -> 
    @state.sheet[ ri ][ ci ] = value
    @setState sheet: @state.sheet

  render: ->
    console.log 'Rendering tracker'

    div className:              'tracker',
      div className:            'container',
        row null, 
          column null,
            input
              className:        'nullButton'
              type:             'submit'
              value:            ''

          _.map @state.sheet[0], (c, ci) ->
            column null,
              DropDown ci: ci

        _.map @state.sheet, (r, ri) =>

          row null,
            column null,
              input
                className:      'nullButton'
                type:           'submit'
                value:          ri + ''


            _.map r, (c, ci) =>
              column null,
                Cell 
                  ci:       ci
                  ri:       ri
                  content:  c
                  handle:   @handleCell
