inquirer = require 'inquirer'
fs = require 'fs'

settings

if not fs.existsSync 'config.json'
  inquirer.prompt [
    type: 'input'
    name: 'host'
    default: 'localhost'
    message: 'API host:'
  ,
    type: 'input'
    name: 'port'
    default: '3000'
    message: 'API port:'
  ,
    type: 'input'
    name: 'access_token'
    message: 'Access token:'
    validate: (input) ->
      if input
        true
      else
        'Enter a valid access token'
  ], ({host,port,access_token}) ->
    console.log host,port,access_token
    settings = {host,port,access_token}
    fs.writeFileSync 'config.json', JSON.stringify(settings,null,2), encoding: 'utf8'
else
  settingsJSON = fs.readFileSync 'config.json', encoding: 'utf8'
  if settingsJSON.length
    settings = JSON.parse settingsJSON

settings.api_url = 'http://' + settings.host + ':' + settings.port + '/api/v1/'
settings.headers =
  Authorization: 'Bearer ' + settings.access_token

module.exports = settings;