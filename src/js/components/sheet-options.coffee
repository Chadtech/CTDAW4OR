# Dependencies
_        = require 'lodash'
Himesama = require '../himesama'
remote   = get 'remote'
fs       = get 'fs'
dialog   = remote.require 'dialog'

# DOM
{ div, p, input } = Himesama.DOM
{ row, column }   = require './ct-dom'


module.exports = Himesama.createClass

  needs: ['sheetNames']

  handle: (event) ->
    { sheetNames } = @state
    { key }        = @attributes
    si             = @state[key]
    sheetNames[si] = event.target.value
    @setState sheetNames: sheetNames

  save: ->
    dialog.showSaveDialog (dir) =>
      return unless dir?

      {sheetNames} = @state
      { key }      = @attributes
      si           = @state[key]
      sheets       = @state.sheets
      sheet        = sheets[si]

      sheet = _.reduce sheet, 
        (str, row) -> 
          row = _.reduce row, 
            (r,c) ->
              r + ',' + c
          str + row + '\n'
        ''

      sheet = sheet.split ''
      sheet.pop()
      sheet = sheet.join ''
      name  = sheetNames[si]
      name += '.csv'
      fs.writeFileSync name, sheet


  render: ->
    {sheetNames} = @state
    { key }      = @attributes
    si           = @state[key]
    name         = sheetNames[si]

    div className:      'sheet-selections',

      input
        className:      'field'
        placeholder:    'sheet name'
        event:          input: @handle
        value:          name

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

