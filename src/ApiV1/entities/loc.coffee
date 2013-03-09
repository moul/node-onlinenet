{Entity} = require '../Entity'

class Loc extends Entity
  getAllRooms: (fn) =>
    @call 'loc/getAllRooms', fn =>
    # http://console.online.net/api/v1/loc/getAllRooms

  getAllZones: (fn) =>
    @call 'loc/getAllZones', fn =>
    # http://console.online.net/api/v1/loc/getAllZones

  getAllDatacenters: (fn) =>
    @call 'loc/getAllDatacenters', (err, data) =>
      return fn err, data if err
      return fn false, data._data
    # http://console.online.net/api/v1/loc/getAllDatacenters

module.exports = Loc