# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'

# DOM
{ div, p, input } = Himesama.DOM

# Utilities
{ indexFormatter } = require '../utilities'


module.exports = DropRight = Himesama.createClass

  initAttributes: ->          dropped: false
  dropright:      -> @setAttr dropped: true
  close:          -> @setAttr dropped: false

  removeRow: ->
    {ri} = @attributes
    s    = @state.sheets
    s[0].splice ri, 1
    @setState sheets: s
    @setAttr dropped: false

  newRow: (where) ->
    {ri} = @attributes
    s    = @state.sheets
    nr   = []
    l    = s[0].length
    _.times l, (i) => nr.push ''
    s[0].splice where, 0, nr
    @setState sheets: s

  addRowAbove: ->
    {ri} = @attributes
    @newRow ri

  addRowBelow: ->
    {ri} = @attributes
    @newRow ri + 1

  render: ->
    { ri, dropped } = @attributes

    if dropped
      div className:      'dropright',
        div className:    'list-right',
          div className:  'list-right-Item zero',
            input
              className:  'button'
              type:       'submit'
              event:      click: @close
              value:      'close'

          div className:  'list-right-Item one',
            input
              className:  'button G'
              type:       'submit'
              event:      click: @addRowAbove
              value:      'add ^'

          div className:  'list-right-Item two',
            input 
              className:  'button G'
              type:       'submit'
              event:      click: @addRowBelow
              value:      'add v'

          div className:  'list-right-Item three',
            input 
              className:  'button'
              type:       'submit'
              event:      click: @removeRow
              value:      'delete'
    else
      radix = @state.rowRadix
      index = indexFormatter ri, radix

      input
        className:      'nullButton'
        type:           'submit'
        event:          click: @dropright
        value:          index

