#!/usr/bin/env coffee

{ApiV1} = require '..'

{apiKey} = require './credentials'

api = new ApiV1
  apiKey:   apiKey
  #verbose:  true

api.abuse.getAllAbuses (err, abuses) =>
  return console.error err if err

  unless abuses.length
    return console.log '0 abuses'

  for abuse in abuses
    console.log abuse
