inquirer = require 'inquirer'
Table = require 'cli-table'
# RSVP = require 'rsvp'

Module = require '../models/module.coffee'

ModulePrompt =
  choose: (modules) ->
    table = new Table(
      head: ['ID','Name', 'Items']
      colWidths: [4,24, 8]
    )

    for module, i in modules
      table.push [
        i + 1
        module.name
        module.items_count
      ]

    console.log table.toString()

    inquirer.prompt [
      type: 'input'
      name: 'module'
      default: 1
      message: 'Module: '
    ], ({module}) ->
      console.log {module}

module.exports = ModulePrompt