# Quantum

Current version is 0.3

Query various crypto tokens for their address balances. Script automaticaly recognize a protocol by address and return balance of tokens associated with it. Token names are resolved using Chaingear.

On repo project folder type:
```
~ » npm run balance akED569cicPcK37k7BXPRFohXn3jtxNZFa4
{ status: 'success',
  service: 'http://api.etherscan.io',
  address: '0xfc30a6c6d1d61f0027556ed25a670345ab39d0cb',
  quantity: '790000000000000000',
  asset: 'ETH' }
  0.79000000000 ETH
```

Warning: this is a very early version -use at your own risk.

## Supported Protocols

- Using `https://chain.so`: Bitcoin, Litecoin, Dogecoin
- Using `http://etherscan.io`: Ethereum
- Using `https://chainz.cryptoid.info`: Dash, PeerCoin, Blackcoin
- Using `http://jnxt.org`: NXT
- Using `https://api.coinprism.com`: Open Assets Protocol
- Using `https://api.ripple.com`: Ripple and Ripple based IOUs
- Using `localnode`: NXT AE
- Using `localnode`: NEM

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
- Split to two versions: CLI-based and NPM-package
- Add BitShares
- Add CounterParty
- Add Stellar
- Add other cyber•rated systems from CryptoID
- Fix tests (add addresses with static balances)
- Refactoring and optimization
- Rebuild regular expressions for addresses

## License

Under MIT License
