Promise = require("bluebird")
req = Promise.promisify(require("request"))
_ = require("lodash")
InvalidResponseError = require("../errors").InvalidResponseError

chain_so = (addr) ->
  network = switch
    when RegExp('^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$').test(addr) then 'BTC'
    when RegExp('^[Ll][a-km-zA-HJ-NP-Z1-9]{33}$').test(addr) then 'LTC'
    else 'DOGE'

  url = "https://chain.so/api/v2/get_address_balance/#{network}/#{addr}"

  req(url, json: true)
    .timeout(2000)
    .cancellable()
    .spread (resp, json) ->
      if resp.statusCode in [200..299]
        status: "success"
        service: url
        address: json.data.address
        quantity: json.data.confirmed_balance
        asset: network
      else
        if _.isObject(json) and json.message == "error"
          []
        else
          throw new InvalidResponseError service: url, response: resp

    .catch Promise.TimeoutError, (e) ->
      [status: 'error', service: url, message: e.message, raw: e]
    .catch InvalidResponseError, (e) ->
      [status: "error", service: e.service, message: e.message, raw: e.response]

module.exports = chain_so
