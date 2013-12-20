#!/usr/bin/env coffee

{ApiV1} = require '..'

{apiKey} = require './credentials'

api = new ApiV1
  apiKey:   apiKey
  #verbose:  true

api.network.ddosList (err, ddosList) =>
  return console.error err if err

  console.log ddosList
