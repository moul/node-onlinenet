// Generated by CoffeeScript 1.4.0
(function() {
  var OnlineBot, bot, credentials;

  OnlineBot = require('..').OnlineBot;

  credentials = require('./credentials');

  bot = new OnlineBot({
    username: credentials.username,
    password: credentials.password,
    verbose: true
  });

  bot.auth(function() {
    console.log("Connected");
    return bot.servers(function(servers) {
      var server, _i, _len, _results;
      console.log("Servers: ");
      _results = [];
      for (_i = 0, _len = servers.length; _i < _len; _i++) {
        server = servers[_i];
        _results.push(console.log(server));
      }
      return _results;
    });
  });

}).call(this);