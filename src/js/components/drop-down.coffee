# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM


module.exports = DropDown = Himesama.createClass

  needs: [ 'rowRadix' ]

  initAttributes: -> dropped: false
  
  dropdown: -> 
    console.log 'DROP DOWN'
    @setAttr dropped: true
  
  close: -> 
    # console.log 'CLOSE', @
    @setAttr dropped: false

  removeColumn: ->
    { ci }    = @attributes
    { sheets } = @state
    console.log 'ci !!', ci
    _.forEach sheets[0], (r, ri) =>
      sheets[0][ri].splice ci, 1
    @setState sheets: sheets
    @setAttr dropped: false

  newColumn: (where) ->
    {ci} = @attributes
    s    = @state.sheets
    nc   = []
    l    = s[0].length

  addColumLeft: =>
    { ci }    = @attributes
    { sheets } = @state
    _.forEach sheets[0], (r, ri) =>
      sheets[0][ri].splice ci, 0, ''
    @setState sheets: sheets  

  addColumnRight: -> 
    { ci }    = @attributes
    { sheets } = @state
    _.forEach sheets, (r, ri) =>
      sheets[0][ri].splice ci + 1, 0, ''
    @setState sheets: sheet s

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
