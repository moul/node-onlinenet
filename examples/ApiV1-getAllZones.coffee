#!/usr/bin/env coffee

{ApiV1} = require '..'

credentials = require './credentials'

api = new ApiV1
  apiKey:   credentials.apiKey
  verbose:  true

api.loc.getAllZones (err, zones) =>
  return console.log err if err
  console.log zones
