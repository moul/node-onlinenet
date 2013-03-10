url     = require 'url'

class module.exports.ApiV1
  constructor: (@opts = {}) ->
    @opts.enabledEntities ?= ['loc', 'hw']
    @opts.verbose         ?= false
    @opts.url             ?= 'http://console.online.net/api/v1/'
    @opts[k]?= v for k, v of url.parse @opts.url
    @http                 =  if @opts.protocol is 'https:' then require 'https' else require 'http'
    @opts.basePath        ?= @opts.path
    @opts.method          ?= 'GET'
    @opts.port ?= 80

    delete @opts.path
    delete @opts.url
    delete @opts.slashes

    for key in @opts.enabledEntities
      entity = require "./entities/#{key}"
      @[key] = new entity @

  call: (args, fn) =>
    @fetch args, (err, data) =>
      return fn err, data if err
      return fn false, JSON.parse data

  fetch: (args, fn) =>
    if typeof(args) is 'string'
      args = path: args
    args[k] ?= v for k, v of @opts
    args.pathSuffix = args.path
    args.path = "#{args.basePath}#{args.pathSuffix}"
    args['auth'] = "#{@opts.apiKey}:"
    req = @http.request args
    req.on 'error', (err) -> fn err, {}
    req.on 'response', (response) ->
      buffer = ''
      response.on 'data', (chunk) -> buffer += chunk
      response.on 'end', ->
        switch response.statusCode
          when 401 then fn {"code": "AUTH REQUIRED"}, buffer
          when 200 then fn null, buffer if fn
          else          fn {"code": "BADSTATUSCODE", "message": response.statusCode}, buffer
    req.end()
