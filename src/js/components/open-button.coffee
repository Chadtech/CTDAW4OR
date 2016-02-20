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

options = 
  properties: [
    'multiSelections'
    'openFile'
    'openDirectory'
  ]


module.exports = Open = Himesama.createClass

  handle: ->

    { sheets, titles } = @state

    dialog.showOpenDialog options, (fns) =>
      return unless fns? 

      fns = _.filter fns, (fn) -> isCSV fn

      openedSheets = _.map fns, (fn) ->
        csv = fs.readFileSync fn, 'utf-8'
        csv = csv.split '\n'
        _.map csv, (col) -> col.split ','
      sheets = sheets.concat openedSheets
      
      fns    = _.map fns, (fn) -> 
        justFile fn.slice 0, fn.length - 4
      titles = titles.concat fns

      @setState 
        sheets: sheets
        titles: titles


  render: ->

    input
      className:    'left-or-right-sheet open'
      type:         'submit'
      value:        'open'
      event:        click: @handle
    