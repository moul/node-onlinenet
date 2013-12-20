#!/usr/bin/env coffee

{ApiV1} = require '..'

{apiKey} = require './credentials'
Table =     require 'cli-table'

api = new ApiV1
  apiKey:   apiKey
  #verbose:  true

api.user.getUser (err, user) =>
  return console.error err if err

  table = new Table()
  for key, value of user
    entry = {}
    entry[key] = "#{value}"
    table.push entry

  console.log table.toString()