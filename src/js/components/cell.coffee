# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{ div, p, input } = Himesama.DOM

{ colB, rowB } = require '../boundaries'

colB = 10
rowB = 56

module.exports = Himesama.createClass

  handle: (event) ->
    {ci,ri,key} = @attributes
    si       = @state[key]
    {sheets} = @state
    v        = event.target.value
    sheets[si][ri][ci] = v
    @setState sheets: sheets

  focusOn: (event) ->
    {ci,ri}     = @attributes
    # console.log ci, ri
    ci          = ci % colB
    rj          = ri % rowB
    {xOffSet} = @attributes
    {yOffSet} = @attributes 
    {setYOffSet} = @attributes


    switch event.which
      when 13
        if rj is rowB - 1
          console.log 'F', setYOffSet
          yOffSet++
          setYOffSet yOffSet
        else
          @focus ci + 2, rj + 2
      
      when 39
        if ci < colB
          @focus ci + 3, rj + 1
      
      when 40 
       if rj is rowB - 1
          yOffSet++
          setYOffSet yOffSet
        else
          @focus ci + 2, rj + 2
      
      when 37
        if 0 < ci
          @focus ci + 1, rj + 1
      
      when 38
        if 0 < ri
          if 0 < rj
            yOffSet--
            setYOffSet yOffSet
          else
            @focus ci + 2, rj + 2

          @focus ci + 2, rj


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
