var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var MultiBalances = artifacts.require("./MultiBalances.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.link(ConvertLib, MultiBalances);
  deployer.deploy(MetaCoin);
  deployer.deploy(MultiBalances);
};
