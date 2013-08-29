request = require 'request'
RSVP = require 'rsvp'
settings = require '../settings'

class Course

Course.findAll = ->
  new RSVP.Promise (resolve, reject) ->
    request 
      url: settings.api_url + 'courses'
      headers: settings.headers
    , (error, response, body) ->
      body = JSON.parse body
      if body?.errors?
        console.log 'Error:', body?.errors?.message
        error()
      else
        resolve body

module.exports = Course