inquirer = require 'inquirer'
Table = require 'cli-table'
# RSVP = require 'rsvp'

Module = require '../models/module.coffee'
ModulePrompt = require './module.coffee'

CoursePrompt =
  choose: (courses) ->
    # console.log courses

    table = new Table(
      head: ['','Code', 'Name']
      colWidths: [3,12, 50]
    )

    for course, i in courses
      table.push [
        i + 1
        course.course_code
        course.name
      ]

    console.log table.toString()

    inquirer.prompt [
      type: 'input'
      name: 'course_id'
      message: 'Course: '
      default: 1
      choices: courses.map (course) ->
        name: course.name
        value: course.id
    ], ({course_id}) -> CoursePrompt.menu course_id

  menu: (course_id) ->
    inquirer.prompt [
      type: "rawlist"
      message: "Menu:"
      name: "section"
      choices: [
        # 'Announcements'
        # 'Assignments'
        # 'Discussions'
        # 'Grades'
        # 'People'
        # 'Pages'
        # 'Files'
        # 'Syllabus'
        # 'Outcomes'
        # 'Quizzes'
        'Modules'
        # 'Settings'
      ]
    ], ({section}) ->
      switch section
        when 'Modules'
          Module.findAll({course_id}).then ModulePrompt.choose

module.exports = CoursePrompt