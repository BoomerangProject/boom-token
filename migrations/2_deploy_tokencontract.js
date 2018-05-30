var SafeMath = artifacts.require("./SafeMath.sol");
var BoomToken = artifacts.require("./BoomToken.sol");

module.exports = function(deployer) {
  deployer.deploy(SafeMath);
  deployer.link(SafeMath, BoomToken);
  deployer.deploy(BoomToken);
};
