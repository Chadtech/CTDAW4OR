# Dependencies
_              = require 'lodash'
Himesama       = require '../himesama'

# DOM
{ div, input } = Himesama.DOM
{ row,column } = require './ct-dom'

# Components
DropDown       = require './drop-down'
DropRight      = require './drop-right'
Cell           = require './cell'
DeleteButton   = require './delete-button'
AddButton      = require './add-button'

# Utilities
bounds         = require '../boundaries'


module.exports = Himesama.createClass

  needs: [ 'sheets',  'radix', 'offsets' ]

  initAttributes: ->
    yOffSet: 0
    xOffSet: 0

  addRow: ->
    { key }  = @attributes
    {sheets} = @state
    si       = @state[key]
    s        = sheets[si]
    l        = s[0].length
    nr       = _.times l, -> ''
    sheets[si].unshift nr
    @setState sheets: sheets


  render: ->
 
    { sheets } = @state
    { key }    = @attributes
    si         = @state[key]
    s          = sheets[si]
    l          = s[0].length
    t          = Math.min l, 10
    columns    = _.times t, 
      (ci) =>
        column null,
          DropDown 
            key: key
            ci:  ci

    {offsets}  = @state
    { y }      = offsets[key]

    rows       = s.slice y, bounds.y + y
    rows       = _.map rows, (r, ri) =>

      cells    = r.slice 0, bounds.x
      cells    = _.map cells, 
        (c, ci) =>
          column null,
            Cell
              ci:       ci
              ri:       ri
              si:       si
              key:      key
              content:  c 

      row               null,
        column          null,
          DeleteButton  
            key:        key
            ri:         ri
          AddButton     
            key:        key
            ri:         ri
        column          null,
          DropRight 
            key:        key
            ri:         ri
        cells

    div className:      'container',
      row               null, 
        column          null,
          input
            className:  'nullButton add'
            type:       'submit'
            event:      click: @addRow
            value:      'v'
        column          null,
          input
            className:  'nullButton'
            type:       'submit'
            value:      ''
        columns
      rows

