bs58check = require('bs58check')

module.exports =
  chainso: (addr) ->
    chainso = RegExp('^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$').test(addr) ||
      RegExp('^[LlDd][a-km-zA-HJ-NP-Z1-9]{33}$').test(addr)
    if chainso
      return true
    else false
  # counterparty: new RegExp('\b\B')
  # dogeparty: new RegExp('\b\B')
  # mastercoin: new RegExp('^[13][a-km-zA-HJ-NP-Z0-9]{26,33}$')

 # Ethereum account address starts with 0x
 # Example 0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae
  ethereum: (addr) ->
    RegExp('^(0x)?[0-9a-f]{40}$').test(addr)

  # Short name for sending funds to an account, rXXXX
  # Example r9kiSEUEw6iSCNksDVKf9k3AyxjW3r1qPf
  ripple: (addr) ->
    RegExp('^r[1-9A-HJ-NP-Za-km-z]{25,33}$').test(addr)

  # Addresses are always prefixed with "NXT-",
  # and hyphens are used to separate the address
  # into groups of 4, 4, 4, and then 5 characters.
  # The addresses are NOT case-sensitive.
  # Example NXT-8MVA-XCVR-3JC9-2C7C3
  nxt: (addr) ->
    RegExp('^(NXT|nxt)(-[a-zA-Z0-9]{1,5})+$').test(addr)

  # Example NXT-8N9W-TN4F-YA2S-H5B7R
  nxtassets: (addr) ->
    RegExp('^(NXT|nxt)(-[a-zA-Z0-9]{1,5})+$').test(addr)

  # Example NXT-4VDY-LNVT-LMAY-FMCKA
  nxtcurrencies: (addr) ->
    RegExp('^(NXT|nxt)(-[a-zA-Z0-9]{1,5})+$').test(addr)
  # coloredcoins: new RegExp('^[13][a-km-zA-HJ-NP-Z0-9]{26,33}$')

  # Currently two networks are defined: the test network whose account
  # addresses start with a capital T and the main network whose account
  # addresses always start with a capital N. Addresses have always a
  # length of 40 characters and are base-32 encoded.
  # Example NALICE2A73DLYTP4365GNFCURAUP3XVBFO7YNYOW
  nem: (addr) ->
    RegExp('^[(n)(N)(T)(t)][a-zA-Z0-9]{5}([^(-)][a-zA-Z0-9]{4,6})+$').test(addr)

  # Using cryptoid for Dash (starts with X) and Peercoin(starts with P)
  # Blackcoin (starts withc B)
  # address length is 34
  # Example for Peercoin is PGVtF7DJ4KtndgdYZ472skrZQx3MDHNymt
  # Example for Dash is XfgNCeTJxBVHb9CCpn52QyfjfpBmPQUYdA
  # Example for Blackcoin is B95qcCHpma5XZu4n6hP9pP5APiasCR16Ts
  cryptoid: (addr) ->
    RegExp('^[XPB][a-km-zA-HJ-NP-Z1-9]{33}$').test(addr)

  # The namespace used for Open Assets is 19 (0x13 in hexadecimal)
  # Example akB4NBW9UuCmHuepksob6yfZs6naHtRCPNy
  openassets: (addr) ->
    try decoded = bs58check.decode(addr)
    catch error
      return false
    decoded[0] == 19

