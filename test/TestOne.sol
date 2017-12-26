pragma solidity ^0.4.4;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Main.sol";

contract TestOne {
  function testAddProduct() {
    Main m = Main(DeployedAddresses.Main());

    m.addProduct("xyz@gmail.compassword123","123");
    bytes32 prevOwnerHash = m.fetchOwnerHash("xyz@gmail.compassword123");
    bytes32 ownerHash;
    bytes32 previousTrackingId;
    (ownerHash,previousTrackingId) = m.getRecord("123");

    Assert.equal(prevOwnerHash, ownerHash, "Product Add UnSuccessful!");
  }

  function testTransfer(){
    Main m = Main(DeployedAddresses.Main());
    m.addProduct("xyz@gmail.compassword123","123");
    bytes32 prevOwnerHash = m.fetchOwnerHash("xyz@gmail.compassword123");
    m.registerUser("abc@gmail.compassword123");
    bytes32 newOwnerHash = m.fetchOwnerHash("abc@gmail.compassword123");
    bool result = m.transfer(newOwnerHash,"xyz@gmail.compassword123","123");
    bytes32 ownerHash;
    bytes32 previousTrackingId;
    (ownerHash,previousTrackingId) = m.getRecord("123");
    Assert.equal(ownerHash, newOwnerHash, "Product Transfer UnSuccessful!");
  }

  function testTransferWithoutRegister(){
    Main m = Main(DeployedAddresses.Main());
    m.addProduct("xyz@gmail.compassword123","1234");
    bytes32 prevOwnerHash = m.fetchOwnerHash("xyz@gmail.compassword123");
    // m.registerUser("abcd@gmail.compassword123");
    bytes32 newOwnerHash = m.fetchOwnerHash("abcd@gmail.compassword123");
    bool result = m.transfer(newOwnerHash,"xyz@gmail.compassword123","1234");
    Assert.equal(result,false,"Product transfered without registering!");
  }

  function testReAddingProduct(){
    Main m = Main(DeployedAddresses.Main());
    bool dummy = m.addProduct("xyz@gmail.compassword123","123");
    bool result = m.addProduct("xyz@gmail.compassword123","123");
    Assert.equal(result, false, "Product Re-Add Condition not Working!");
  }

}
