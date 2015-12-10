module.exports =
  # chainso: new RegExp('\b\B')
  # counterparty: new RegExp('\b\B')
  # dogeparty: new RegExp('\b\B')
  # mastercoin: new RegExp('^[13][a-km-zA-HJ-NP-Z0-9]{26,33}$')
  # ethereum: new RegExp('^[(NXT)(nxt)]-[a-km-zA-HJ-NP-Z0-9]{1,4}-[a-km-zA-HJ-NP-Z0-9]{1,4}-[a-km-zA-HJ-NP-Z0-9]{1,4}-[a-km-zA-HJ-NP-Z0-9]{1,5}$')
  # ripple: new RegExp('\b\B')
  # nxt: new RegExp('\b\B')
  # nxtassets: new RegExp('\b\B')
  # nxtcurrencies: new RegExp('\b\B')
  # coloredcoins: new RegExp('^[13][a-km-zA-HJ-NP-Z0-9]{26,33}$')

  # Currently two networks are defined: the test network whose account 
  # addresses start with a capital T and the main network whose account 
  # addresses always start with a capital N. Addresses have always a 
  # length of 40 characters and are base-32 encoded.
  nem: new RegExp('^[(n)(N)(T)(t)][a-zA-Z0-9]{5}([^(-)][a-zA-Z0-9]{4,6})+$')
  
  # cryptoid: new RegExp('\b\B')
  # openassets: new RegExp('\b\B')
