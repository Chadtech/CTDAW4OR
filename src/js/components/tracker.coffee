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

{ colB, rowB } = require '../boundaries'

colB = 10
rowB = 56

module.exports = Himesama.createClass

  needs: [ 'sheets',  'rowRadix' ]

  initAttributes: ->
    yOffSet: 0
    xOffSet: 0

  addRow: ->
    { key }    = @attributes
    { sheets } = @state
    si         = @state[key]
    s          = sheets[si]
    l          = s[0].length
    nr         = []
    _.times l, (i) => nr.push ''
    sheets[si].unshift nr
    @setState sheets: sheets

  setYOffSet: (y) ->
    console.log 'E'
    @setAttr yOffSet: y

  setXOffSet: (x) ->
    @setAttr xOffSet: x

  render: ->
    console.log 'G'

    { sheets } = @state
    { key }    = @attributes
    si         = @state[key]
    s          = sheets[si]
    l          = s[0].length
    columns    = []
    t          = Math.min l, 10
    _.times t, (ci) =>
      columns.push column null,
        DropDown 
          key:          key
          ci:           ci

    rows       = s.slice 0, rowB
    rows       = _.map rows, (r, ri) =>

      cells    = r.slice 0, colB
      cells    = _.map cells, 
        (c, ci) =>
          column null,
            Cell _.extend 
              ci:       ci
              ri:       ri
              key:      key
              content:  c 
              @attributes
              setXOffSet: @setXOffSet
              setYOffSet: @setYOffSet


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

