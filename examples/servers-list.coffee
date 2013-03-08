#!/usr/bin/env coffee

{OnlineBot} = require '..'
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
      console.log server
