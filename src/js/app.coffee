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
  sheetNames:  ['Sheet 0 : $$$', 'US States', 'Yeeeee', ';;;;;;;;--===/H', 'Numbers???']
  rowRadix:    8

# Components
Main = require './main'


App = Himesama.createClass

  render: -> 
    div null, 
      Main null

Render App(), document.getElementById 'mount'

