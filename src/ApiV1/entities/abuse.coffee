{Entity} = require '../Entity'


class Abuse extends Entity
  getAllAbuses: (fn) =>             @call 'abuse', fn


module.exports = Abuse
