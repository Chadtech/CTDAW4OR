# Libraries
Himesama             = require 'himesama'
{ DOM, Doc, Render } = Himesama
{ initState }        = Himesama
{ getElementById }   = Doc

# DOM
{ div } = DOM

# State
initState sheet: (require './blank-sheet')()

# Components
Main = require './main'

App = Himesama.createClass

  render: ->
    div null, Main()


Render App(), getElementById 'mount'

