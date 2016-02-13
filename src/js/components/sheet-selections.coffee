# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM
{ row, column }   = require './ct-dom'


module.exports = Himesama.createClass

  needs: [ 'sheetNames', 'sheets' ]

  setSheet: (event) ->
    { tn, key }  = @attributes
    payload = {}
    v = event.target
    v = v.getAttribute 'sheet-index'
    payload[ key ] = parseInt v
    @setAttr sheetIndex: v
    @setState payload


  getClass: (i) ->
    { key } = @attributes
    index = @state[key]
    if i is index 
      'selected-sheet-option'
    else 'sheet-option'


  add: ->
    {sheets, sheetNames} = @state
    newSheet = (require '../blank-sheet')()
    sheets.push newSheet   
    i = 0
    n = 'new-sheet '
    i++ while (n + i) in sheetNames
    sheetNames.push n + i
    @setState
      sheetNames: sheetNames
      sheets:     sheets

  render: ->
    { sheetNames } = @state

    sheetButtons = 
      _.map sheetNames, (name, i) =>
        input
          className:  @getClass i
          sheetIndex: i
          type:       'submit'
          event:      click: @setSheet
          value:      name
    
    sheetButtons.push input
      className: 'left-or-right-sheet add'
      event:     click: @add
      type:      'submit'
      value:     'add'



    div className:    'sheet-selections',

      input
        className:    'left-or-right-sheet'
        type:         'submit'
        value:        '<<'

      sheetButtons

      input
        className:    'left-or-right-sheet'
        style:        float: 'right'
        type:         'submit'
        value:        '>>'  

   

