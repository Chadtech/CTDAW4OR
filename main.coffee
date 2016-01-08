electron      = require 'electron'
# console.log el
app           = electron.app
BrowserWindow = electron.BrowserWindow

# electron.crashReporter.start()

mainWindow = undefined

app.on 'window-all-closed', ->
  if process.platform isnt darwin
    app.quit()

app.on 'ready', ->
  mainWindow = new BrowserWindow (width: 800, height: 600)
  mainWindow.loadURL 'file://' + __dirname + '/public/index.html'
  mainWindow.webContents.openDevTools()
  mainWindow.on 'closed', ->
    mainWindow = null