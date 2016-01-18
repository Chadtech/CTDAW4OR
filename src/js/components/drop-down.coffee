# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }  = Himesama

# DOM
{ div, p, input } = DOM


module.exports = DropDown = Himesama.createClass

  initAttributes: -> dropped: false
  
  dropdown: -> @setAttr dropped: true
  
  close: -> @setAttr dropped: false

  removeColumn: ->
    { ci } = @attributes
    _.forEach @state.sheet, (r, ri) =>
      @state.sheet[ri].splice ci, 1
    @setState sheet: @state.sheet

  addColumLeft: ->
    { ci } = @attributes
    _.forEach @state.sheet, (r, ri) =>
      @state.sheet[ri].splice ci, 0, ''
    @setState sheet: @state.sheet   

  addColumnRight: -> 
    { ci } = @attributes
    _.forEach @state.sheet, (r, ri) =>
      @state.sheet[ri].splice ci + 1, 0, ''
    @setState sheet: @state.sheet 

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
