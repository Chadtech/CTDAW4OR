# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'
remote   = get 'remote'
fs       = get 'fs'
dialog   = remote.require 'dialog'

# Utilities
{ isCSV, getDir } = require '../utilities'

# DOM
{ div, input } = Himesama.DOM


module.exports = New = Himesama.createClass


  handle: ->
    { sheets, sheetNames } = @state
    newSheet = (require '../blank-sheet')()
    sheets.push newSheet   
    i = 0
    n = 'blank-sheet '
    i++ while (n + i) in sheetNames
    sheetNames.push n + i
    @setState
      sheetNames: sheetNames
      sheets:     sheets


  render: ->

    input
      className:  'left-or-right-sheet new'
      type:       'submit'
      value:      'new'
      event:      click: @handle