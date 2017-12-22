pragma solidity ^0.4.4;

import "./Basic.sol";

contract Login is Basic{

  function verify(string info,string productId) returns (bool){
    bytes32 trackingId = items[productId];
    ProofEntry acOwner = proofs[trackingId];
    byte32 newKey = keccak256(info);
    if(newKey == acOwner.privateKey)
    {
      return true;
    }
    else {
      return false;
    }
  }

}
