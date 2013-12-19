{Entity} = require '../Entity'


class Server extends Entity
  getAllServers: (fn) =>             @call 'server', fn
  getServerInfo: (server_id, fn) =>  @call "server/#{server_id}", fn


module.exports = Server
