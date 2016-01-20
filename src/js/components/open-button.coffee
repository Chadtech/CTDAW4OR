# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'
{ DOM }  = Himesama
remote   = get 'remote'
fs       = get 'fs'
dialog   = remote.require 'dialog'

# Utilities
{ isCSV } = require '../utilities'

# DOM
{ div, input } = DOM


module.exports = Open = Himesama.createClass


  handle: ->
    options = 
      properties: [
        'multiSelections'
        'openFile'
        'openDirectory'
      ]

    dialog.showOpenDialog options, (fns) =>
      # fns is 'fileNames'
      return unless fns?
      fns = _.filter fns, (fn) -> isCSV fn
      openedSheets =  _.map fns, (fn) ->
        csv = fs.readFileSync fn, 'utf-8'
        csv = csv.split '\n'
        _.map csv, (col) -> col.split ','

      @setState sheet: openedSheets[0]


  render: ->

    input
      className:      'option-button'
      type:           'submit'
      value:          'open'
      event:          click: @handle
    