class BaseBot
  constructor: (@options) ->
    do @handleOptions
    do @init
    @debug "Bot is ready"

  log: (args...) =>
    console.log "OnlineBot>", args...

  debug: (args...) =>
    @log args... unless @options.verbose is false

  handleOptions: =>
    @options.verbose ?= false
    @debug "handleOptions()"

  init: =>
    @browser = new (require('zombie'))
    @debug "init()"

  visit: (path, fn = null) =>
    @debug "Visiting #{path}"
    @browser.visit "#{@options.base_url}#{path}", =>
      @debug "#{path} is loaded"
      do fn if fn

  getjQuery: =>
    @browser.window.jQuery

module.exports = BaseBot
