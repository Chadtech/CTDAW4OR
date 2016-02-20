# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'
remote   = get 'remote'
fs       = get 'fs'
dialog   = remote.require 'dialog'

# Utilities
{ isCSV, getDir } = require '../utilities'
blankSheet        = require '../blank-sheet'

# DOM
{ div, input } = Himesama.DOM


module.exports = New = Himesama.createClass


  handle: ->
    { sheets, titles } = @state
    newSheet = blankSheet()
    sheets.push newSheet   
    i = 0
    n = 'blank-sheet '
    i++ while (n + i) in titles
    titles.push n + i
    @setState
      titles: titles
      sheets: sheets


  render: ->

    input
      className:  'left-or-right-sheet new'
      type:       'submit'
      value:      'new'
      event:      click: @handle