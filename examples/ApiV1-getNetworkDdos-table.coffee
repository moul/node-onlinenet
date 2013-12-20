#!/usr/bin/env coffee

{ApiV1} = require '..'
Table = require 'cli-table'

{apiKey} = require './credentials'

api = new ApiV1
  apiKey:   apiKey
  #verbose:  true

api.network.ddosList (err, ddosList) =>
  return console.error err if err

  table = new Table
    style:
      compact:         true
      head:            ['red']
      border:          ['grey']
      'padding-left':  1
      'padding-right': 1
    head: ['id', 'target', 'start', 'mitigation', 'type', 'max pps', 'max bps']

  for ddos in ddosList
    table.push [
      ddos.id
      ddos.target
      ddos.start
      ddos.mitigation
      ddos.type
      ddos.max_pps
      ddos.max_bps
      ]
  console.log table.toString()
