# Dependencies
Himesama = require '../himesama'

# DOM
{ div }  = Himesama.DOM


module.exports = 

  row: -> 
    arguments[0] = className: 'row'
    div.apply @, arguments
    
  column: ->
    arguments[0] = className: 'column'
    div.apply @, arguments