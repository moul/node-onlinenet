// Generated by CoffeeScript 1.5.0
(function() {
  var ApiV1, api, credentials,
    _this = this;

  ApiV1 = require('..').ApiV1;

  credentials = require('./credentials');

  api = new ApiV1({
    apiKey: credentials.apiKey,
    verbose: true
  });

  api.loc.getAllDatacenters(function(err, datacenters, entities) {
    if (err) {
      return console.log(err);
    }
    console.log('datacenters', datacenters);
    return console.log('entities', entities);
  });

}).call(this);
