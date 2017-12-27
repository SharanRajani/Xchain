var Mortal = artifacts.require("./Mortal.sol");
var Basic = artifacts.require("./Basic.sol");
var Backtracking = artifacts.require("./Backtracking.sol");
var Encrypted = artifacts.require("./Encrypted.sol");
var Login = artifacts.require("./Login.sol");
var Transfer = artifacts.require("./Transfer.sol");
var TransferOwnership = artifacts.require("./TransferOwnership.sol");
var Main = artifacts.require("./Main.sol");


module.exports = function(deployer) {
  deployer.deploy(Mortal);
  deployer.link(Mortal, Basic);
  deployer.deploy(Basic);
  deployer.link(Basic, Backtracking);
  deployer.deploy(Backtracking);
  deployer.link(Basic, Encrypted);
  deployer.deploy(Encrypted);
  deployer.link(Basic, Login);
  deployer.deploy(Login);
  deployer.link(Basic, TransferOwnership);
  deployer.link(Encrypted, TransferOwnership);
  deployer.deploy(TransferOwnership);
  deployer.link(Login, Transfer);
  deployer.link(TransferOwnership, Transfer);
  deployer.deploy(Transfer);
  deployer.link(Backtracking, Main);
  deployer.link(Encrypted, Main);
  deployer.link(Transfer, Main);
  deployer.deploy(Main);  
};
