# Dependencies
Himesama = require 'himesama'
{ DOM }   = Himesama

# DOM
{ div, p, input } = DOM


module.exports = DropDown = Himesama.createClass

  needs:      [ 'dropdown' ]

  isDropped:  'NOPE'
  
  handle: ->
    if @isDropped is 'YEEE'
      @isDropped = 'NOPE'
    else
      @isDropped = 'YEEE'
    @setState dropdown: ''

  render: ->
    { columnIndex } = @attributes

    dropdown = undefined 

    if @isDropped is 'YEEE'
      dropdown = 
        div className: 'dropdown',
          div className: 'list-down',
            div className: 'list-down-Item zero',
              input
                className: 'button'
                type:      'submit'
                event:     click: @handle
                value:     'close'

            div className:  'list-down-Item one',
              input
                className: 'button G'
                type:      'submit'
                event:     click: @handle
                value:     '< add'

            div className:  'list-down-Item two',
              input 
                className:  'button G'
                type:       'submit'
                event:      click: @handle
                value:      'add >'

            div className:  'list-down-Item three',
              input 
                className:  'button'
                type:       'submit'
                event:      click: @handle
                value:      'delete'
    else
      dropdown = 
        div null,
          input
            className:  'nullButton'
            type:       'submit'
            event:      click: @handle
            value:      columnIndex

    dropdown
