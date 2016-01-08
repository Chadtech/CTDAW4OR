# Libraries
Himesama                 = require 'himesama'
{ el, Doc, Render }      = Himesama
{ Component, initState } = Himesama
Render                   = Himesama.getRender()
{ getElementById }       = Doc

# DOM
p   = el 'p'
div = el 'div'

# State
Himesama.initState 
  sheet: (require './blank-sheet')()

# Components
Main = require './main'

App = Himesama.Component

  render: ->
    div null,
      Main



Render App, getElementById 'mount'

