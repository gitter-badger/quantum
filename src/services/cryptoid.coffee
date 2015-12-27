Promise = require("bluebird")
req = Promise.promisify(require("request"))
_ = require("lodash")
InvalidResponseError = require("../errors").InvalidResponseError
json = []

cryptoid = (addr) ->
  currency = switch
    when RegExp('^[X][a-km-zA-HJ-NP-Z1-9]{33}$').test(addr) then 'dash'
    when RegExp('^[P][a-km-zA-HJ-NP-Z1-9]{33}$').test(addr) then 'ppc'
    when RegExp('^[B][a-km-zA-HJ-NP-Z1-9]{33}$').test(addr) then 'blk'
    else 'DASH'

  url = "http://chainz.cryptoid.info/#{currency}/api.dws?q=getbalance&a=#{addr}"

  req(url, json: true)
    .timeout(2000)
    .cancellable()
    .spread (resp) ->
      if resp.statusCode in [200..299]
        status: "success"
        service: url
        address: addr
        quantity: resp.body
        asset: currency.toUpperCase()
      else
        if _.isObject(json) and json.message == "error"
          []
        else
          throw new InvalidResponseError service: url, response: resp

    .catch Promise.TimeoutError, (e) ->
      [status: 'error', service: url, message: e.message, raw: e]
    .catch InvalidResponseError, (e) ->
      [status: "error", service: e.service, message: e.message, raw: e.response]

module.exports = cryptoid
