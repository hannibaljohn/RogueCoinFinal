var RogueCoin = artifacts.require("./RogueCoin.sol");
var RogueCoinSale = artifacts.require("./RogueCoinSale.sol")


module.exports = function(deployer) {
  deployer.deploy(RogueCoin, 1000000).then(function() {
    // token price is 0.001 ether
    var tokenPrice = 1000000000000000;
    return deployer.deploy(RogueCoinSale, RogueCoin.address,tokenPrice);
  });
};
