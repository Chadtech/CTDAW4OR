# Dependencies
Himesama = require '../himesama'
{ DOM }   = Himesama

# DOM
{ div, p, input } = DOM


module.exports = DropRight = Himesama.createClass

  initAttributes: -> dropped: false

  dropright: -> @setAttr dropped: true

  close: -> @setAttr dropped: false

  removeRow: ->
    { ri } = @attributes
    @state.sheet.splice ri, 1
    @setState sheet: @state.sheet

  addRowAbove: ->
    { ri } = @attributes
    sheet = @state.sheet
    newRow = _.reduce [ 0 .. sheet[0].length ],
      (sum) -> sum.push 0
      [] 
    sheet.splice ri, 0, newRow
    @setState sheet: sheet

  addRowBelow: ->
    { ri } = @attributes
    sheet = @state.sheet
    newRow = _.reduce [ 0 .. sheet[0].length ],
      (sum) -> sum.push 0
      [] 
    sheet.splice ri + 1, 0, newRow
    @setState sheet: sheet

  render: ->
    { ri, dropped } = @attributes

    console.log 'get Rend'

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
      div null,
        input
          className:      'nullButton'
          type:           'submit'
          event:          click: @dropright
          value:          ri + ''

