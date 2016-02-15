# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM


module.exports = Himesama.createClass

  handle: (event) ->
    {ci,ri,key} = @attributes
    si       = @state[key]
    {sheets} = @state
    v        = event.target.value
    sheets[si][ri][ci] = v
    @setState sheets: sheets

  focusOn: (event) ->
    {ci,ri} = @attributes
    switch event.which
      when 13
        @focus ci + 1, ri + 2
      when 39
        @focus ci + 2, ri + 1
      when 40 
        @focus ci + 1, ri + 2
      when 37
        @focus ci, ri + 1
      when 38
        @focus ci + 1, ri

  focus: (ci, ri) ->
    {key} = @attributes
    trackeri = 0
    trackeri = 1 if key is 'righti'
    qs  = '[himesama-id="0.0.1.'
    qs += trackeri + '.2.' + ri
    qs += '.' + ci + '.0"]'
    below = document.querySelector qs
    below?.focus()

  render: ->
    { content } = @attributes

    className  = 'cell'
    className += ' filled' if content

    input
      className: className
      event:     
        input:   @handle
        keydown: @focusOn
      value:     content
