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

justFile = (fn) ->
  i = fn.length - 1
  i-- until fn[i] is '/'
  fn.slice i + 1


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

      { sheets, sheetNames } = @state
      sheets = sheets.concat openedSheets
      fns = _.map fns, (fn) -> 
        fn = fn.slice 0, fn.length - 4
        fn = justFile fn

      sheetNames = sheetNames.concat fns

      @setState 
        sheets:      sheets
        sheetNames: sheetNames


  render: ->

    input
      className:    'option-button'
      type:         'submit'
      value:        'open'
      event:        click: @handle
    