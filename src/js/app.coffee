# Libraries
_                    = require 'lodash'
Himesama             = require './himesama'
{ DOM, Doc, Render } = Himesama
{ initState }        = Himesama
{ getElementById }   = Doc


# DOM
{ div } = DOM

# State
initState 
  sheets:      [ (require './blank-sheet')() ]
  sheetNames:  ['Sheet 0 : $$$', 'US States', 'Yeeeee', ';;;;;;;;--===/H', 'Numbers???']
  rowRadix:    8

# Components
Main = require './main'


App = Himesama.createClass

  render: -> 
    div null, 
      Main null

Render App(), getElementById 'mount'

