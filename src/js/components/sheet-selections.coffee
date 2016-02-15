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


  render: ->
    { sheetNames } = @state

    sheetButtons = _.map sheetNames, 
      (name, i) =>
        input
          className:  @getClass i
          sheetIndex: i
          type:       'submit'
          event:      click: @setSheet
          value:      name
    

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

   

