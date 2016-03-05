# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'
remote   = get 'remote'
fs       = get 'fs'
dialog   = remote.require 'dialog'

# DOM
{ div, p, input } = Himesama.DOM
{ row, column }   = require './ct-dom'

# Utilities
{ getDir } = require '../utilities'


module.exports = Himesama.createClass

  needs: [ 'titles' ]

  handle: (event) ->
    { titles } = @state
    { key }    = @attributes
    si         = @state[key]
    titles[si] = event.target.value
    @setState titles: titles

  close: ->
    { key }  = @attributes
    si       = @state[key]
    {titles} = @state
    {sheets} = @state
    titles.splice si, 1
    sheets.splice si, 1
    @setState 
      sheets: sheets   
      titles: titles

  save: ->
    {saveDir} = @state

    writeFile = (dir) =>
      {titles} = @state
      { key }  = @attributes
      si       = @state[key]
      sheets   = @state.sheets
      sheet    = sheets[si]

      sheet = _.reduce sheet, 
        (str, row) -> 
          row = _.reduce row, 
            (r,c) ->
              r + ',' + c
          str + row + '\n'
        ''

      {saveDir} = @state
      sheet = sheet.split ''
      sheet.pop()
      sheet = sheet.join ''
      name  = titles[si]
      name += '.csv'
      name  = dir + '/' + name
      fs.writeFileSync name, sheet


    if saveDir.length
      writeFile saveDir
    else
      dialog.showSaveDialog (fn) =>
        return unless fn?
        fn = getDir fn
        @setState saveDir: fn
        writeFile fn


  render: ->
    {titles} = @state
    { key }  = @attributes
    si       = @state[key]
    title    = titles[si]

    div className:      'sheet-selections',

      input
        className:      'field'
        placeholder:    'sheet name'
        event:          input: @handle
        value:          title

      input
        className:      'left-or-right-sheet save'
        event:          click: @save
        type:           'submit'
        value:          'save'
      
      input
        className:      'left-or-right-sheet close'
        event:          click: @close
        type:           'submit'
        value:          'close'

