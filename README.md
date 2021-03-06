# Quantum

Query various crypto tokens for their address balances. Script automaticaly recognize a protocol by address and return balance of tokens associated with it. Token names are resolved using Chaingear.

Maintainer @ValeryLitvin

On repo project folder type:
```
~ » npm run balance 0xfc30a6c6d1d61f0027556ed25a670345ab39d0cb

  { status: 'success',
  service: 'http://api.etherscan.io',
  address: '0xfc30a6c6d1d61f0027556ed25a670345ab39d0cb',
  quantity: '790000000000000000',
  system: 'Ethereum' }

  0.79000000000 ethers
```

Warning: this is a very early version -use at your own risk.

## Supported Protocols

- Using `https://chain.so`: Bitcoin, Litecoin, Dogecoin
- Using `http://etherscan.io`: Ethereum
- Using `http://blockscan.com`: Counterparty
- Using `https://chainz.cryptoid.info`: Dash, PeerCoin, Blackcoin
- Using `https://api.coinprism.com`: Open Assets Protocol
- Using `https://api.ripple.com`: Ripple and Ripple based IOUs
- Using `http://nxt.cyber.fund`: NXT and NXT AE
- Using `http://nem.cyber.fund`: NEM

## Installation

```
~ » git clone https://github.com/cyberFund/quantum
~ » cd quantum
~ » make init
~ » make build
```

## Tests
Warning: some tests may not pass because balances was changed
```
~ » npm test
```
## Next Milestone
- Add BitShares
- Add other cyber•rated systems from CryptoIDnces)
- Refactoring and optimization
- Rebuild regular expressions for addresses

## License

Under MIT License
