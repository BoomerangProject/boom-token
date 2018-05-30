var SafeMath = artifacts.require("./SafeMath.sol");
var BoomTokenLockup = artifacts.require("./BoomTokenLockup.sol");

module.exports = function(deployer) {
   deployer.deploy(SafeMath);
   deployer.link(SafeMath, BoomTokenLockup);

   var tokenContractAddress = '';
   var beneficiary = '';

   deployer.deploy(BoomTokenLockup, tokenContractAddress, beneficiary);
};
