const Users = artifacts.require("./Users.sol");
// const HoneyToken = artifacts.require("./HoneyToken.sol");
// const HoneyTokenSale = artifacts.require("./HoneyTokenSale.sol");
// const HoneyTokenAirdrop = artifacts.require("./HoneyTokenAirdrop.sol");
const Casino = artifacts.require('./Casino.sol');

module.exports = function(deployer) {
  deployer.deploy(Users);
  deployer.deploy(Casino, 1000, 10);
  // deployer.deploy(HoneyToken).then(function() {
  //   deployer.deploy(HoneyTokenAirdrop).then(function() {
  //     deployer.deploy(HoneyTokenSale, HoneyToken.address, HoneyTokenAirdrop.address);
  //   });
  // });
};
