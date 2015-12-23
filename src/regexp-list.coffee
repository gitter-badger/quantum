module.exports =
  # chainso: new RegExp('\b\B')
  # counterparty: new RegExp('\b\B')
  # dogeparty: new RegExp('\b\B')
  # mastercoin: new RegExp('^[13][a-km-zA-HJ-NP-Z0-9]{26,33}$')

 # Ethereum account address starts with 0x
 # Example 0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae
  ethereum: new RegExp('^(0x)?[0-9a-f]{40}$')

  # Short name for sending funds to an account, rXXXX
  # Example r9kiSEUEw6iSCNksDVKf9k3AyxjW3r1qPf
  ripple: new RegExp('^r[1-9A-HJ-NP-Za-km-z]{25,33}$')

  # Addresses are always prefixed with "NXT-",
  # and hyphens are used to separate the address
  # into groups of 4, 4, 4, and then 5 characters.
  # The addresses are NOT case-sensitive.
  # Example NXT-8MVA-XCVR-3JC9-2C7C3
  nxt: new RegExp('^(NXT|nxt)(-[a-zA-Z0-9]{1,5})+$')

  # nxtassets: new RegExp('\b\B')
  # nxtcurrencies: new RegExp('\b\B')
  # coloredcoins: new RegExp('^[13][a-km-zA-HJ-NP-Z0-9]{26,33}$')

  # Currently two networks are defined: the test network whose account
  # addresses start with a capital T and the main network whose account
  # addresses always start with a capital N. Addresses have always a
  # length of 40 characters and are base-32 encoded.
  # Example NALICE2A73DLYTP4365GNFCURAUP3XVBFO7YNYOW
  nem: new RegExp('^[(n)(N)(T)(t)][a-zA-Z0-9]{5}([^(-)][a-zA-Z0-9]{4,6})+$')

  # cryptoid: new RegExp('\b\B')
  # openassets: new RegExp('\b\B')
