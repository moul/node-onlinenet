class module.exports.Entity
  constructor: (@api) ->

  call: (path, fn) =>
    @api.call path, fn
