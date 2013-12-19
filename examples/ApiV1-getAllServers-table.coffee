#!/usr/bin/env coffee

{ApiV1} = require '..'

{apiKey} =  require './credentials'
Table =     require 'cli-table'
async =     require 'async'

api = new ApiV1
  apiKey:   apiKey
  #verbose:  true

api.server.getAllServers (err, servers) =>
  return console.error err if err

  server_ids = [parseInt server.$ref.split('/')[-1...][0] for server in servers][0]


  iterator = (server_id, callback) ->
    api.server.getServerInfo server_id, (err, info) =>
      #console.log err, info
      process.nextTick ->
        callback err, info


  async.mapLimit server_ids, 5, iterator, (err, servers) ->
    table = new Table
      style:
        compact:         true
        head:            ['red']
        border:          ['grey']
        'padding-left':  1
        'padding-right': 1
      head: ['hostname', 'offer', 'os', 'support', 'proactive monitoring',
        'location', 'boot mode', 'anti_ddos', 'power', 'last_reboot',
        'hardware watch', 'ips']

    for server in servers
      table.push [
        server.hostname
        server.offer
        server.os.name
        server.support
        server.proactive_monitoring
        server.location.datacenter
        server.boot_mode
        server.anti_ddos
        server.power
        server.last_reboot
        server.hardware_watch
        server.ip.length
        ]

    console.log table.toString()
