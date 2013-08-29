request = require 'request'
Course = require './models/course'
CoursePrompt = require './prompts/course'

Course.findAll().then(CoursePrompt.choose)