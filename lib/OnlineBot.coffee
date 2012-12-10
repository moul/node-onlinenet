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

    getLastActivity: (fn = null) =>
        @debug "getLastActivity()"
        @visit "account/home", =>
            $ = @getjQuery()
            activity = []
            $('.content .box table:nth(1) tr td').each ->
                activity.push $(this).html().trim().replace(/[\n\t]/g, ' ').replace(/\ \ */g, ' ')
            @debug "Activity list: #{activity.length} entries"
            fn activity

    getServersList: (fn = null) =>
        @debug "getServersList()"
        @visit "server/list", =>
            $ = @getjQuery()
            servers = []
            $('tr').each ->
                id = parseInt $(@).find('td:nth-child(2)').text().trim()
                if id > 0
                    server =
                        id: id
                        valid: !!$(@).find('td:nth-child(1) img').attr('src').match(/valid/)
                        distrib: $(@).find('td:nth-child(3) img').attr('src').split('_')[1].split('.')[0]
                        offer: $(@).find('td:nth-child(4)').text().trim()
                        ip: $(@).find('td:nth-child(5)').text().trim()
                        reverse: $(@).find('td:nth-child(6)').text().trim()
                    servers.push server
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
