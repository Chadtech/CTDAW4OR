# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM
{ row, column }   = require './ct-dom'


module.exports = Himesama.createClass

  needs: [ 'sheetNames' ]

  initAttributes: ->
    sheetIndex: 0

  setSheet: (event) ->
    { tn, key }  = @attributes
    payload = {}
    v = event.target
    v = v.getAttribute 'sheet-index'
    payload[ key ] = parseInt v
    @setState payload


  getClass: (i) ->
    { sheetIndex } = @attributes
    if i is sheetIndex 
      'selected-sheet-option'
    else 'sheet-option'


  render: ->
    { sheetNames } = @state

    div className:    'sheet-selections',

      input
        className:    'left-or-right-sheet'
        type:         'submit'
        value:        '<<'

      _.map sheetNames, (name, i) =>
        input
          className:  @getClass i
          sheetIndex: i
          type:       'submit'
          event:      click: @setSheet
          value:      name

      input
        className:    'left-or-right-sheet'
        style:        float: 'right'
        type:         'submit'
        value:        '>>'    

