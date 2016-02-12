# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM


module.exports = DropDown = Himesama.createClass

  initAttributes: ->          dropped: false
  dropdown:       -> @setAttr dropped: true
  close:          -> @setAttr dropped: false

  removeColumn: ->
    { ci }     = @attributes
    s = @state.sheets
    _.forEach s[0], (r, ri) =>
      s[0][ri].splice ci, 1
    @setState sheets: s
    @setAttr dropped: false

  newColumn: (where) ->
    s = @state.sheets
    l = s[0][0].length
    w = where
    _.times l, (i) =>
      s[0][i].splice w, 0, ''
    @setState sheets: s

  addColumLeft: ->
    { ci } = @attributes
    @newColumn ci

  addColumnRight: -> 
    { ci } = @attributes
    @newColumn ci + 1

  render: ->
    { ci, dropped } = @attributes

    if dropped
      div className:      'dropdown',
        div className:    'list-down',
          div className:  'list-down-Item zero',
            input
              className:  'button'
              type:       'submit'
              event:      click: @close
              value:      'close'

          div className:  'list-down-Item one',
            input
              className:  'button G'
              type:       'submit'
              event:      click: @addColumLeft
              value:      '< add'

          div className:  'list-down-Item two',
            input 
              className:  'button G'
              type:       'submit'
              event:      click: @addColumnRight
              value:      'add >'

          div className:  'list-down-Item three',
            input 
              className:  'button'
              type:       'submit'
              event:      click: @removeColumn
              value:      'delete'
    else
      div null,
        input
          className:      'nullButton'
          type:           'submit'
          event:          click: @dropdown
          value:          ci + ''
