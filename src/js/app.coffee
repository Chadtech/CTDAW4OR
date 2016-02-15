# Dependencies
_             = require 'lodash'
Himesama      = require './himesama'
{ Render }    = Himesama
{ initState } = Himesama
blankSheet    = (require './blank-sheet')()

# DOM
{ div } = Himesama.DOM

# State
initState 
  sheets:      [ blankSheet ]
  sheetNames:  [ 'blank-sheet 0' ]
  rowRadix:    8
  lefti:       0
  righti:      0

# Components
Main = require './main'


App = Himesama.createClass

  render: -> 
    div null,
      Main null

Render App(), document.getElementById 'mount'

