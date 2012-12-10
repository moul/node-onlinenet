BaseBot = require "./BaseBot"

class OnlineBot extends BaseBot
    handleOptions: =>
        @options.base_url ?= 'https://console.online.net/en/'
        @options.servers ?= []
        super

    init: =>
        @authenticated = false
        super

    auth: (fn = null) =>
        @debug "auth()"
        @visit "login", =>
            @browser.fill '_username', @options.username
            @browser.fill '_password', @options.password
            @browser.pressButton 'Sign in', =>
                @debug "Signed in"
                @authenticated = true
                do fn if fn

    getServersList: (fn = null) =>
        @debug "getServersList()"
        @visit "server/list", =>
            $ = @getjQuery()
            servers = []
            $('tr td:nth-child(2)').each ->
                servers.push parseInt $(@).html()
            @options.servers = servers
            @debug "Server list: #{servers}"
            fn @options.servers if fn

    getServerStats: (server_id = null, fn = null) =>
        server_id = @options.servers[0] if not server_id
        @visit "server/stats/#{server_id}", =>
            console.log "LOADED"

    servers: (fn) =>
        if @options.servers?.length
            fn @options.servers
        else
            @getServersList fn

module.exports = OnlineBot
