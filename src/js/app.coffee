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
  left:    0
  right:   0
  offsets:
    left:
      x:   0
      y:   0
      t:   0
    right:
      x:   0
      y:   0
      t:   0
  saveDir: ''

# Components
Main = require './main'


App  = Himesama.createClass

  render: -> 
    div null,
      Main null


mount = document.getElementById 'mount'
Render App(), mount

