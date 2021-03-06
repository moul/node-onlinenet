// Generated by CoffeeScript 1.6.3
(function() {
  var ApiV1, api, credentials,
    _this = this;

  ApiV1 = require('..').ApiV1;

  credentials = require('./credentials');

  api = new ApiV1({
    apiKey: credentials.apiKey,
    verbose: true
  });

  api.hw.getRacksByZone(15, function(err, racks, entities) {
    if (err) {
      return console.log(err);
    }
    console.log('racks', racks);
    return console.log('entities', entities);
  });

}).call(this);
