# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ el }   = Himesama

# DOM
div   = el 'div'
input = el 'input'


module.exports = Cell = (ci, ri, content, handle) ->

  className =  'cell'
  className += ' filled' if content

  input
    className:      className
    eventListeners:
      input:        handle
    col:            ci
    row:            ri
    value:          content
