# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'
{ DOM }  = Himesama

# DOM
{ div, p, input } = DOM
{ row, column }   = require './ct-dom'

# Components
DropDown  = require './drop-down'
DropRight = require './drop-right'
Cell      = require './cell'


module.exports = Tracker = Himesama.createClass

  needs: [ 'sheets',  'rowRadix' ]

  render: ->

    div className:            'container',
      row null, 
        column null,
          input
            className:        'nullButton'
            type:             'submit'
            value:            ''

        _.map (@state.sheets[0].slice 0, 11), (c, ci) ->
          column null,
            DropDown ci: ci

      _.map (@state.sheets[0].slice 0 , 37), (r, ri) =>

        row null,
          column null,
            DropRight ri: ri

          _.map (r.slice 0, 11), (c, ci) =>
            column null,
              Cell 
                ci:       ci
                ri:       ri
                content:  c

