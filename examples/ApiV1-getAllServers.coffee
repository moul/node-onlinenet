#!/usr/bin/env coffee

{ApiV1} = require '..'

{apiKey} = require './credentials'

api = new ApiV1
  apiKey:   apiKey
  #verbose:  true

api.server.getAllServers (err, servers) =>
  return console.error err if err
  for server in servers
    server_id = parseInt server.$ref.split('/')[-1...][0]

    api.server.getServerInfo server_id, (err, info) =>
      console.log err, info
