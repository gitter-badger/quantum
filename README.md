# Quantum

Current version is 0.3

Query various crypto tokens for their address balances.

Warning: this is a very early version -use at your own risk.

## Supported

- Bitcoin, Litecoin, Dogecoin (with ChainSo)
- Ethereum
- Ripple
- NXT and NXT assets
- NEM (with local node)
- Dash, PeerCoin, Blackcoin (with CryptoID)
- Open Assets

## Installation

```
~ » git clone https://github.com/cyberFund/quantum
~ » make init
~ » make build
```

## How to Use
On repo project folder type:
```
~ » npm run balance <address>
```


## Tests
Warning: some tests may not pass because balances was changed
```
~ » npm test
```
## Next Milestone
- split to two versions: CLI-based and NPM-package
- Add BitShares
- Add Stellar
- Add CounterParty
- Add other altcoins from CryptoID
- Fix tests (add addresses with static balances)
- Refactoring and optimization
- Rebuild regular expressions for addresses

## License

Under MIT License
