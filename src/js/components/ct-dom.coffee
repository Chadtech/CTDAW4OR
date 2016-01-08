# Dependencies
Himesama = require 'Himesama'
{ el }   = Himesama

# DOM
p     = el 'p'
div   = el 'div'
input = el 'input'

row = -> 
  arguments[0] = className: 'row'
  div.apply @, arguments

column = ->
  arguments[0] = className: 'column'
  div.apply @, arguments

module.exports = 
  row:    row
  column: column