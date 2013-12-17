{Entity} = require '../Entity'


class Loc extends Entity
  getAllServers: (fn) =>             @call 'server', fn
  getServerInfo: (server_id, fn) =>  @call "server/#{server_id}", fn


module.exports = Loc
