pragma solidity ^0.4.4;

import "./Basic.sol";

contract Encrypted is Basic {

    function addProduct(string password, string productId) public returns(bool){
        if(hasEntry(productId))
          return false;
        else {
        bytes32 owner = keccak256(bytes32ToString(keccak256(password)));
        bytes32 privateKey =  keccak256(password);
        bytes32 previousTrackingId = keccak256("root");
        bytes32 trackingId = keccak256(productId);
        proofs[trackingId] = ProofEntry(owner, privateKey, previousTrackingId);
        register[owner] = registerEntry(owner , privateKey);
        items[productId] = trackingId;
        productAdded(password,owner,productId);
        return true;
      }
    }
    function registerUser(string password) public returns(bool) {
        bytes32 owner = keccak256(bytes32ToString(keccak256(password)));
        if(register[owner].owner != "")
          return false;
        else
        {
        bytes32 privateKey = keccak256(password);
        register[owner] = registerEntry(owner, privateKey);
        return true;
        }
    }

    function fetchOwnerHash(string password) public pure returns (bytes32){
        bytes32 owner = keccak256(bytes32ToString(keccak256(password)));
        return owner;
    }

}
