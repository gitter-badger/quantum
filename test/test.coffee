require "./test_helper"
balance = require "../src/crypto-balance"
_ = require("lodash")


describe "Balance", ->

  it "has a XCP balance", (done) ->
    balance("16WhhnUUCZVvszFxsaCG3d6v77Qin1LErQ").then (result) ->
      counterparty = _.find(result, (item) -> item.asset == "XCP")
      expect(counterparty).to.exist
      expect(counterparty.quantity).to.be.not.empty
      done()

  it "has a DASH balance", (done) ->
    balance("XfgNCeTJxBVHb9CCpn52QyfjfpBmPQUYdA").then (result) ->
      dash = _.find(result, (item) -> item.asset == "DASH")
      expect(dash).to.exist
      expect(dash.quantity).to.be.not.empty
      done()

  it "has a PPC balance", (done) ->
    balance("PGVtF7DJ4KtndgdYZ472skrZQx3MDHNymt").then (result) ->
      peercoin = _.find(result, (item) -> item.asset == "PPC")
      expect(peercoin).to.exist
      expect(peercoin.quantity).to.be.not.empty
      done()

  it "has a BLK balance", (done) ->
    balance("B95qcCHpma5XZu4n6hP9pP5APiasCR16Ts").then (result) ->
      blackcoin = _.find(result, (item) -> item.asset == "BLK")
      expect(blackcoin).to.exist
      expect(blackcoin.quantity).to.be.not.empty
      done()

  it "has a LTC balance", (done) ->
    balance("LLiwS8XkQ7ra4XAg1TybTWrwnqFvMhiRfE").then (result) ->
      litecoin = _.find(result, (item) -> item.asset == "LTC")
      expect(litecoin).to.exist
      expect(litecoin.quantity).to.be.not.empty
      done()

  it "has a DOGE balance", (done) ->
    balance("DDogepartyxxxxxxxxxxxxxxxxxxw1dfzr").then (result) ->
      doge = _.find(result, (item) -> item.asset == "DOGE")
      expect(doge).to.exist
      expect(doge.quantity).to.be.not.empty
      done()

  it "has a OA balance", (done) ->
    balance("akNgsNMWbjM4svehXchCPkPsLRVAMJU7nrj").then (result) ->
      open_assets = _.find(result, (item) -> item.asset == "CFUND")
      expect(open_assets).to.exist
      expect(open_assets.quantity).to.be.not.empty
      done()

  it "has a ETH balance", (done) ->
    balance("1ebacb7844fdc322f805904fbf1962802db1537c").then (result) ->
      ethereum = _.find(result, (item) -> item.asset == "ETH")
      expect(ethereum).to.exist
      expect(ethereum.quantity).to.be.not.empty
      done()

  it "has a XRP balance", (done) ->
    balance("rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh").then (result) ->
      ripple = _.find(result, (item) -> item.asset == "XRP")
      expect(ripple).to.exist
      expect(ripple.quantity).to.be.not.empty
      done()

  it "has a XEM balance", (done) ->
    balance("NALICE2A73DLYTP4365GNFCURAUP3XVBFO7YNYOW").then (result) ->
      nem = _.find(result, (item) -> item.asset == "XEM")
      expect(nem).to.exist
      expect(nem.quantity).to.be.not.empty
      done()

 it "has a NQT balance", (done) ->
    balance("NXT-8MVA-XCVR-3JC9-2C7C3").then (result) ->
      nxt = _.find(result, (item) -> item.asset == "NQT")
      expect(nxt).to.exist
      expect(nxt.quantity).to.be.not.empty
      done()
