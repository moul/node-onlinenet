url     = require 'url'
request = require 'request'

class module.exports.ApiV1
  constructor: (@opts = {}) ->
    @opts.enabledEntities ?= ['loc', 'hw', 'server']
    @opts.verbose         ?= false
    @opts.url             ?= 'https://console.online.net/api/v1/'
    @opts.method          ?= 'GET'

    for key in @opts.enabledEntities
      entity = require "./entities/#{key}"
      @[key] = new entity @

  call: (args, fn) =>
    @fetch args, (err, data) =>
      return fn err,   data            if err
      return fn false, JSON.parse data

  fetch: (opts, fn) =>
    if typeof(opts) is 'string'
      opts = path: opts
    opts.uri = "#{@opts.url}#{opts.path}"
    opts.headers = {}
    opts.headers['Authorization'] = "Bearer #{@opts.apiKey}"
    opts.hostname = @opts.hostname

    if @opts.verbose
      opts.headers['X-Pretty-JSON'] = 1
      console.info opts

    callback = (err, response, body) =>
      return fn err, response, body if err

      switch response.statusCode
        when 200 then # everything is ok
        when 401 then err = {"code": "AUTH REQUIRED"}
        else          err = {"code": "BADSTATUSCODE", "message": response.statusCode}

      fn err, body

    req = request opts, callback
