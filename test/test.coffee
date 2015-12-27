require "./test_helper"
balance = require "../src/crypto-balance"
_ = require("lodash")


describe "Balance", ->

  # it "gets something", (done) ->
  #   balance("DP15mU18LLcLMpULSpFm5R77FYjsjjRCPu").then (result) ->
  #     expect(result).to.be.an "array"
  #     expect(result).to.not.be.empty
  #     done()

  # it "has a custom Dogeparty asset", (done) ->
  #   balance("DCt8sxHX634ghqdDhWFtCPQUyZ3TEfLBCo").then (result) ->
  #     expect(result).to.not.be.empty
  #     dp = _.find(result, (item) -> item.asset == "XDP/DOGEPARTY")
  #     expect(dp).to.exist
  #     expect(dp.quantity).to.be.eq "1.00000000"
  #     done()

  # it "has a MSC balance", (done) ->
  #   balance("1Po1oWkD2LmodfkBYiAktwh76vkF93LKnh").then (result) ->
  #     msc = _.find(result, (item) -> item.asset == "MSC")
  #     expect(msc).to.exist
  #     expect(msc.quantity).to.be.eq "1738.58121469"
  #     done()

  # it "deals correctly with OmniWallet's API not being available", (done) ->
  #   balance("1MaStErt4XsYHPwfrN9TpgdURLhHTdMenH").then (result) ->
  #     msc = _.find(result, (item) -> _.contains(item.service, "omniwallet"))
  #     expect(msc).to.exist
  #     expect(msc.status).to.be.eq "error"
  #     done()

  # it "has a MAID balance", (done) ->
  #   balance("1madYsPmALf1TCo1qttumTH7Hbbro5uQD").then (result) ->
  #     maid = _.find(result, (item) -> item.asset == "MAID")
  #     expect(maid).to.exist
  #     expect(maid.quantity).to.be.eq "47600.00000000"
  #     done()


  # it "has some Open Assets balances", (done) ->
  #   balance("1LUZHtvrHqaJ3jerhqQkQkcqrm9DzTaJop").then (result) ->
  #     klippt = _.find(result, (item) -> item.asset == "OA/KLIPPT")
  #     expect(klippt).to.exist
  #     expect(klippt.quantity).to.be.eq "298599.00000000"
  #     gold = _.find(result, (item) -> item.asset == "OA/GOLD-COINS")
  #     expect(gold).to.exist
  #     expect(gold.quantity).to.be.eq "10000.00000000"
  #     cfs = _.find(result, (item) -> item.asset == "OA/CFS")
  #     expect(cfs).to.exist
  #     expect(cfs.quantity).to.be.eq "1.00000000"
  #     done()

  # it "handles unknown OA asset difinitions gracefully", (done) ->
  #   balance("1KhrhXz8fXorDrLn8XMopx422eUnGiphgg").then (result) ->
  #     unknown = _.find(result, (item) -> item.asset == "OA/AdKhXXbFrk7WFNSwWSZhVX9vYJPk99bFYU")
  #     expect(unknown).to.exist
  #     expect(unknown.quantity).to.be.eq "10000000.00000000"
  #     done()

  # it "handles failing requests to one service correctly", (done) ->
  #   balance("DDAa254Jf99rLzmGe4wA3Shr7MaYBHDd1b").then (result) ->
  #     expect(result).to.have.length(2)
  #     success = _.find(result, (item) -> item.status == "success")
  #     expect(success).to.exist

  #     error = _.find(result, (item) -> item.status == "error")
  #     expect(error).to.exist
  #     expect(error.service).to.be.eq "https://wallet.dogeparty.io/_api"
  #     expect(error.message).to.be.eq "Server error. Code: -32000. Got call_jsonrpc_api request error: [Errno 111] Connection refused"
  #     done()

  it "has a XCP balance", (done) ->
    balance("16WhhnUUCZVvszFxsaCG3d6v77Qin1LErQ").then (result) ->
      open_assets = _.find(result, (item) -> item.asset == "XCP")
      expect(open_assets).to.exist
      expect(open_assets.quantity).to.be.eq '0'
      done()

  it "has a DASH balance", (done) ->
    balance("XfgNCeTJxBVHb9CCpn52QyfjfpBmPQUYdA").then (result) ->
      open_assets = _.find(result, (item) -> item.asset == "DASH")
      expect(open_assets).to.exist
      expect(open_assets.quantity).to.be.eq '374.87958574'
      done()

  it "has a PPC balance", (done) ->
    balance("PGVtF7DJ4KtndgdYZ472skrZQx3MDHNymt").then (result) ->
      open_assets = _.find(result, (item) -> item.asset == "PPC")
      expect(open_assets).to.exist
      expect(open_assets.quantity).to.be.eq '0'
      done()

  it "has a BLK balance", (done) ->
    balance("B95qcCHpma5XZu4n6hP9pP5APiasCR16Ts").then (result) ->
      open_assets = _.find(result, (item) -> item.asset == "BLK")
      expect(open_assets).to.exist
      expect(open_assets.quantity).to.be.eq '0'
      done()

  it "has a LTC balance", (done) ->
    balance("LLiwS8XkQ7ra4XAg1TybTWrwnqFvMhiRfE").then (result) ->
      open_assets = _.find(result, (item) -> item.asset == "LTC")
      expect(open_assets).to.exist
      expect(open_assets.quantity).to.be.eq '0.00000000'
      done()

  it "has a DOGE balance", (done) ->
    balance("DDogepartyxxxxxxxxxxxxxxxxxxw1dfzr").then (result) ->
      open_assets = _.find(result, (item) -> item.asset == "DOGE")
      expect(open_assets).to.exist
      expect(open_assets.quantity).to.be.eq '1831619391.01419473'
      done()

  it "has a OA balance", (done) ->
    balance("akNgsNMWbjM4svehXchCPkPsLRVAMJU7nrj").then (result) ->
      open_assets = _.find(result, (item) -> item.asset == "CFUND")
      expect(open_assets).to.exist
      expect(open_assets.quantity).to.be.eq '100.000000'
      done()

  it "has a ETH balance", (done) ->
    balance("1ebacb7844fdc322f805904fbf1962802db1537c").then (result) ->
      ethereum = _.find(result, (item) -> item.asset == "ETH")
      expect(ethereum).to.exist
      expect(ethereum.quantity).to.be.eq '0.00000000'
      done()

  it "has a XRP balance", (done) ->
    balance("rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh").then (result) ->
      ripple = _.find(result, (item) -> item.asset == "XRP")
      expect(ripple).to.exist
      expect(ripple.quantity).to.be.eq '72.81445'
      done()

  it "has a XEM balance", (done) ->
    balance("NALICE2A73DLYTP4365GNFCURAUP3XVBFO7YNYOW").then (result) ->
      nem = _.find(result, (item) -> item.asset == "XEM")
      expect(nem).to.exist
      expect(nem.quantity).to.be.eq 15750000000000
      done()

 it "has a NQT balance", (done) ->
    balance("NXT-8MVA-XCVR-3JC9-2C7C3").then (result) ->
      nxt = _.find(result, (item) -> item.asset == "NQT")
      expect(nxt).to.exist
      expect(nxt.quantity).to.be.eq '2275971531379999998200000'
      done()
