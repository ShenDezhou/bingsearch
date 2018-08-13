Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'bingsearch:bing-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://cn.bing.com/search?q=#{cased}"
        Shell.openExternal url
