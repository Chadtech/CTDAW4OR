# Dependencies
_             = require 'lodash'
Himesama      = require './himesama'
{ Render }    = Himesama
{ initState } = Himesama
blankSheet    = (require './blank-sheet')()

# DOM
{ div }       = Himesama.DOM

# State
initState 
  sheets:  [ blankSheet ]
  titles:  [ 'blank-sheet 0' ]
  radix:   8
  lefti:   0
  righti:  0
  offsets:
    lefti:
      x:   0
      y:   0
    righti:
      x:   0
      y:   0

# Components
Main = require './main'


App  = Himesama.createClass

  render: -> 
    div null,
      Main null


mount = document.getElementById 'mount'
Render App(), mount

