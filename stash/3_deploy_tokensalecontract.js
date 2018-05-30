var SafeMath = artifacts.require("./SafeMath.sol");
var BoomTokenSale = artifacts.require("./BoomTokenSale.sol");

module.exports = function(deployer) {
   deployer.deploy(SafeMath);
   deployer.link(SafeMath, BoomTokenSale);

   var wallet = '';
   var startTime = 1509541200;
   var tokenContractAddress = '';

   deployer.deploy(BoomTokenSale, wallet, startTime, tokenContractAddress);
};
