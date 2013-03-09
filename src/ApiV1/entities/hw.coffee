{Entity} = require '../Entity'

class Hw extends Entity
  getRacksByZone: (zone, fn) =>
    @call "loc/getRacksByZone/#{zone}", fn
    # http://console.online.net/api/v1/hw/getRacksByZone/15

module.exports = Hw