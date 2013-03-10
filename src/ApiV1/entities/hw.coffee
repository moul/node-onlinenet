{Entity} = require '../Entity'

class Hw extends Entity
  getRacksByZone: (zone, fn) =>
    @call "hw/getRacksByZone/#{zone}", (err, data) =>
      return fn err, data if err
      return fn false, data._data, data._entities
    # http://console.online.net/api/v1/hw/getRacksByZone/15

module.exports = Hw