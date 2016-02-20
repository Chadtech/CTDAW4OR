# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'

# DOM
{div, p, input} = Himesama.DOM

# Utilities
bounds          = require '../boundaries'


module.exports  = Himesama.createClass

  handle: (event) ->
    {ci,ri,key} = @attributes
    { offsets } = @state
    ri         += offsets[key].y
    ci         += offsets[key].x
    si          = @state[key]
    { sheets }  = @state
    v           = event.target.value
    sheets[si][ri][ci] = v
    @setState sheets: sheets

  focusOn: (event) ->
    {ci,ri,key} = @attributes
    { offsets } = @state
    { x, y }    = offsets[key]
    ci          = ci % bounds.x
    rj          = ri % bounds.y

    switch event.which

      # Enter
      when 13
        if rj is bounds.y - 1
          offsets[key].y++
          @setState offsets: offsets
        else
          @focus ci + 2, rj + 2
      
      # Right Arrow
      when 39
        if ci < bounds.x
          @focus ci + 3, rj + 1
      
      # Down Arrow
      when 40 
        if event.metaKey

          if bounds.y - 10 < rj
            offsets[key].y += 10
            @setState offsets: offsets
          else
            @focus ci + 2, rj + 11

        else
          if rj is bounds.y - 1
            offsets[key].y++
            @setState offsets: offsets
          else
            @focus ci + 2, rj + 2
      
      # Left Arrow
      when 37
        if 0 < ci
          @focus ci + 1, rj + 1
      
      # Up Arrow
      when 38
        if event.metaKey
          if 9 < y and rj < 10
            offsets[key].y -= 10
            @setState offsets: offsets
          else
            @focus ci + 2, rj - 9
        else
          if -1 < rj
            if 0 < y and rj is 0
              offsets[key].y--
              @setState offsets: offsets
            else
              @focus ci + 2, rj


  focus: (ci, ri) ->
    {key}   = @attributes
    tracker = 0
    tracker = 1 if key is 'right'
    qs      = '[himesama-id="0.0.1.'
    qs     += tracker + '.2.' + ri
    qs     += '.' + ci + '.0"]'
    below   = document.querySelector qs
    below?.focus()


  render: ->
    {content}  = @attributes
    className  = 'cell'
    className += ' filled' if content

    input
      className: className
      event:     
        input:   @handle
        keydown: @focusOn
      value:     content
