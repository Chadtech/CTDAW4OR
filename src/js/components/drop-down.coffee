# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }   = Himesama

# DOM
{ div, p, input } = DOM


module.exports = DropDown = Himesama.createClass

  aaname:     'drop down!!!'

  # needs:      [ 'dropdown' ]

  isDropped:  'NOPE'
  
  handle: ->
    console.log 'DROPPED!!'
    if @isDropped is 'YEEE'
      @isDropped = 'NOPE'
    else
      @isDropped = 'YEEE'
    @dirty = true
    # @rerender ['dropdown']
    # setTimeout (=> console.log @), 1000
    # console.log 'At is', @

  removeColumn: ->
    { ci } = @attributes
    _.forEach @state.sheet, (r, ri) =>
      @state.sheet[ri].splice ci, 1
    @setState sheet: @state.sheet

  render: ->
    { ci } = @attributes

    console.log 'Gettin Rendered', @isDropped, @

    if @isDropped is 'YEEE'
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
              event:      click: @removeColumn
              value:      'delete'
    else
      div null,
        input
          className:  'nullButton'
          type:       'submit'
          event:      click: @handle
          value:      ci + ''
