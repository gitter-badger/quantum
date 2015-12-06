Promise = require("bluebird")
req = Promise.promisifyAll(require("request"))
_ = require("lodash")
json = []

cryptoid = (addr) ->
  Promise
    .all ['ltc']
    .map (currency) ->
      url = "http://chainz.cryptoid.info/#{currency}/api.dws?q=getbalance&a=#{addr}"
      req.getAsync(url)
        .spread (resp, body) ->
          json =  {'data':['asset': currency, 'balance': JSON.parse(body), 'address': addr]}
          _.merge json.data, service: url
          json
    .map (asset) ->
      data = asset.data
      status: 'success'
      address: data[0].address
      quantity: data[0].balance
      asset: data[0].asset.toUpperCase()
    .filter (item) -> !!item


module.exports = cryptoid
