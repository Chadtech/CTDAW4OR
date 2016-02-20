# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM
{ row, column }   = require './ct-dom'


module.exports = Himesama.createClass

  needs: [ 'titles', 'sheets', 'offsets' ]

  setSheet: (event) ->
    v = event.target
    v = v.getAttribute 'sheet-i'

    { key }      = @attributes
    payload      = {}
    payload[key] = parseInt v
    @setAttr sheetIndex: v
    @setState payload

  getClass: (i) ->
    {key} = @attributes
    index = @state[key]
    if i is index 
      'selected-sheet-option'
    else 'sheet-option'

  shiftRight: ->
    {offsets} = @state
    {titles}  = @state
    { key }   = @attributes
    { t }     = offsets[key]
    l         = titles.length
    offsets[key].t++ if t < l
    @setState offsets: offsets

  shiftLeft: ->
    {offsets} = @state
    {titles}  = @state
    { key }   = @attributes
    { t }     = offsets[key]
    offsets[key].t-- if 0 < t
    @setState offsets: offsets


  render: ->
    {titles}  = @state
    {offsets} = @state
    { key }   = @attributes
    t         = offsets[key].t
    titles    = titles.slice t, t + 5

    sheetButtons = _.map titles, 
      (title, i) =>
        i += t
        input
          className: @getClass i
          sheetI:    i
          type:      'submit'
          event:     click: @setSheet
          value:     title
    

    div className:   'sheet-selections',

      input
        className:   'left-or-right-sheet'
        type:        'submit'
        event:       click: @shiftLeft
        value:       '<<'

      input
        className:   'left-or-right-sheet'
        type:        'submit'
        event:       click: @shiftRight
        value:       '>>'  

      sheetButtons

   

