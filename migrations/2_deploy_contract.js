var ApproveOrder = artifacts.require("./ApproveOrder.sol");
var ApproveRetailerOrder = artifacts.require("./ApproveRetailerOrder.sol");

module.exports = function(deployer) {
  deployer.deploy(ApproveOrder);
  deployer.deploy(ApproveRetailerOrder);

};