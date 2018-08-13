Shell = require 'shell'

module.exports =
   config: ->
     en: ->
        type: 'boolean',
        title: 'International',
        description: 'Search English Contents',
        default: false,
        order: 1

  activate: ->
    atom.commands.add 'atom-workspace', 'bingsearch:bing-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = if config.en then "https://cn.bing.com/search?q=#{cased}&ensearch=1" else "https://cn.bing.com/search?q=#{cased}"
        Shell.openExternal url
