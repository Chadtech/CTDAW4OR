# Dependencies
Himesama = require '../himesama'
_        = require 'lodash'
remote   = get 'remote'
fs       = get 'fs'
dialog   = remote.require 'dialog'

# Utilities
{ isCSV, getDir } = require '../utilities'

# DOM
{ div, input } = Himesama.DOM

makeCSV = (sheet) ->


module.exports = Open = Himesama.createClass


  handle: ->
    options = 
      properties: [
        'multiSelections'
        'openFile'
        'openDirectory'
      ]

    dialog.showSaveDialog (dir) =>
      return unless dir?

      { sheets, sheetNames } = @state
      sheets = _.map sheets, (sheet, i) ->
        _.reduce sheet, 
          (str, row) ->
            row = _.reduce row, (r, c) ->
              r + ',' + c
            str + row + '\n'
          ''

      _.forEach sheets, (sheet, i) ->
        sheet = sheet.split ''
        sheet.pop()
        sheet = sheet.join ''
        name  = dir
        name += ' - '
        name += sheetNames[i]
        name += '.csv'
        fs.writeFileSync name, sheet
        

  render: ->

    input
      className:      'option-button'
      type:           'submit'
      value:          'save'
      event:          click: @handle