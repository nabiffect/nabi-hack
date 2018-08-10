const Users = artifacts.require("./Users.sol");
const HoneyToken = artifacts.require("./HoneyToken.sol");
const HoneyTokenSale = artifacts.require("./HoneyTokenSale.sol");
const HoneyTokenAirdrop = artifacts.require("./HoneyTokenAirdrop.sol");

module.exports = function(deployer) {
  deployer.deploy(Users);
  deployer.deploy(HoneyToken).then(function() {
    deployer.deploy(HoneyTokenAirdrop).then(function() {
      deployer.deploy(HoneyTokenSale, HoneyToken.address, HoneyTokenAirdrop.address);
    });
  });
};
