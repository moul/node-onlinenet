#!/usr/bin/env coffee

{ApiV1} = require '..'

{apiKey} = require './credentials'

api = new ApiV1
  apiKey:   apiKey
  #verbose:  true

api.user.getUser (err, user) =>
  return console.error err if err

  console.log user