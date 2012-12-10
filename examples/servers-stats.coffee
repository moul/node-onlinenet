#!/usr/bin/env coffee

OnlineBot = require('..').OnlineBot

credentials = require './credentials'

bot = new OnlineBot
    username: credentials.username
    password: credentials.password
    verbose: true

bot.auth ->
    console.log "Connected"
    bot.servers (servers) ->
        console.log "Servers: "
        for server in servers
            bot.getServerStats server.id, (stats) ->
                for kind, graphs of stats
                    console.log "=== #{kind} ==="
                    for graph in graphs
                        console.log graph
