{Entity} = require '../Entity'


class Network extends Entity
  ddosList: (fn) =>             @call 'network/ddos', fn


module.exports = Network
