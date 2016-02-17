# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM


module.exports = DropDown = Himesama.createClass

  needs: ['sheets']

  initAttributes: ->          dropped: false
  dropdown:       -> @setAttr dropped: true
  close:          -> @setAttr dropped: false

  removeColumn: ->
    {ci, key} = @attributes
    si        = @state[key]
    s         = @state.sheets
    _.forEach s[si], (r, ri) =>
      s[si][ri].splice ci, 1
    @setState sheets: s
    @setAttr dropped: false

  newColumn: (where) ->
    {key}    = @attributes
    {sheets} = @state
    si       = @state[key]
    s        = sheets[si]
    l        = s.length
    w        = where
    _.times l, (i) =>
      s[i].splice w, 0, ''
    @setState sheets: sheets
    @setAttr dropped: false

  addColumLeft: ->
    {ci} = @attributes
    @newColumn ci

  addColumnRight: -> 
    {ci} = @attributes
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
