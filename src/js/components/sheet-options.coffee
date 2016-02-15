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
{ isCSV } = require '../utilities'

justFile = (fn) ->
  i = fn.length - 1
  i-- until fn[i] is '/'
  fn.slice i + 1

options = 
  properties: [
    'multiSelections'
    'openFile'
    'openDirectory'
  ]


module.exports = Himesama.createClass

  handle: (event) ->
    { sheetNames } = @state
    { key }        = @attributes
    si             = @state[key]
    sheetNames[si] = event.target.value
    @setState sheetNames: sheetNames


  new: ->
    { sheets, sheetNames } = @state
    newSheet = (require '../blank-sheet')()
    sheets.push newSheet   
    i = 0
    n = 'blank-sheet '
    i++ while (n + i) in sheetNames
    sheetNames.push n + i
    @setState
      sheetNames: sheetNames
      sheets:     sheets

  open: ->
    { sheets, sheetNames } = @state

    dialog.showOpenDialog options, (fns) =>
      return unless fns? 

      fns = _.filter fns, (fn) -> isCSV fn

      openedSheets = _.map fns, (fn) ->
        csv = fs.readFileSync fn, 'utf-8'
        csv = csv.split '\n'
        _.map csv, (col) -> col.split ','
      sheets = sheets.concat openedSheets
      
      fns  = _.map fns, (fn) -> 
        fn = fn.slice 0, fn.length - 4
        fn = justFile fn
      sheetNames = sheetNames.concat fns

      @setState 
        sheets:     sheets
        sheetNames: sheetNames


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
      console.log 'NAME', name
      fs.writeFileSync name, sheet


  render: ->
    {sheetNames} = @state
    { key }      = @attributes
    si           = @state[key]
    name         = sheetNames[si]

    div className:      'sheet-selections',

      input
        className:      'left-or-right-sheet close'
        event:          click: @close
        style:          float: 'right'
        type:           'submit'
        value:          'close'

      input
        className:      'field'
        placeholder:    'sheet name'
        event:          input: @handle
        value:          name

      input
        className:      'left-or-right-sheet add'
        event:          click: @new
        style:          float: 'right'
        type:           'submit'
        value:          'new'

      input
        className:      'left-or-right-sheet open'
        event:          click: @open
        style:          float: 'right'
        type:           'submit'
        value:          'open'

      input
        className:      'left-or-right-sheet save'
        event:          click: @save
        style:          float: 'right'
        type:           'submit'
        value:          'save'
