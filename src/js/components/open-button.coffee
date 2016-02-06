# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'
remote   = get 'remote'
fs       = get 'fs'
dialog   = remote.require 'dialog'

# Utilities
{ isCSV } = require '../utilities'

# DOM
{ div, input } = Himesama.DOM


module.exports = Open = Himesama.createClass


  handle: ->
    options = 
      properties: [
        'multiSelections'
        'openFile'
        'openDirectory'
      ]

    dialog.showOpenDialog options, (fns) =>
      return unless fns? 

      fns = _.filter fns, (fn) -> isCSV fn

      openedSheets = _.map fns, (fn) ->
        csv = fs.readFileSync fn, 'utf-8'
        csv = csv.split '\n'
        _.map csv, (col) -> col.split ','

      @setState sheets: openedSheets


  render: ->

    input
      className:    'option-button'
      type:         'submit'
      value:        'open'
      event:        click: @handle
    