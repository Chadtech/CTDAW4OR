# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ el }   = Himesama

# DOM
p     = el 'p'
div   = el 'div'
input = el 'input'

{ row, column } = require './ct-dom'

# Components
DropDown  = require './drop-down'
Cell      = require './cell'


module.exports = Tracker = -> Himesama.Component

  needs: [ 'sheet' ]

  handleCell: (event) -> 
    ci = event.target.getAttribute 'col'
    ri = event.target.getAttribute 'row'
    @state.sheet[ ri ][ ci ] = event.target.value
    @setState sheet: @state.sheet


  render: ->

    div className:              'tracker',
      div className:            'container',
        row null, 
          column null,
            input
              className:        'nullButton'
              type:             'submit'
              value:            'X'

          _.map @state.sheet[0], (c, ci) ->
            column null,
              DropDown ci + ''

        _.map @state.sheet, (r, ri) =>

          row null,
            column null,
              input
                className:      'nullButton'
                type:           'submit'
                value:          ri + ''


            _.map r, (c, ci) =>
              column null,
                Cell ci, ri, c, @handleCell
