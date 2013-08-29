request = require 'request'
RSVP = require 'rsvp'
settings = require '../settings'

class Module

Module.findAll = ({course_id}) ->
  new RSVP.Promise (resolve, reject) ->
    request 
      url: settings.api_url + "courses/#{course_id}/modules"
      headers: settings.headers
    , (error, response, body) ->
      body = JSON.parse body
      if body?.errors?
        console.log 'Error:', body?.errors?.message
        error()
      else
        resolve body

module.exports = Module