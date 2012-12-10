#!/usr/bin/env coffee

OnlineBot = require('..').OnlineBot

credentials = require './credentials'

bot = new OnlineBot
    username: credentials.username
    password: credentials.password
    verbose: true

bot.auth ->
    console.log "Connected"
    bot.getLastActivity (entries) ->
        console.log "Activity:"
        for entry in entries
            console.log entry
