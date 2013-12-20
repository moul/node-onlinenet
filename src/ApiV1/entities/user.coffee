{Entity} = require '../Entity'


class User extends Entity
  getUser: (fn) =>             @call 'user', fn


module.exports = User
