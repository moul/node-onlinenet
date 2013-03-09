#!/usr/bin/env coffee

{ApiV1} = require '..'

credentials = require './credentials'

api = new ApiV1
  apiKey:   credentials.apiKey
  verbose:  true

api.hw.getRacksByZone 15, (err, racks) =>
  return console.log err if err
  console.log racks
