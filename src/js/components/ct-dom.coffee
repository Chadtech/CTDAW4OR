# Dependencies
Himesama = require 'Himesama'
{ DOM }   = Himesama

# DOM
{ div, p, input } = DOM

row = -> 
  arguments[0] = className: 'row'
  div.apply @, arguments

column = ->
  arguments[0] = className: 'column'
  div.apply @, arguments

module.exports = 
  row:    row
  column: column