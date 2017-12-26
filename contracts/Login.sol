pragma solidity ^0.4.4;

import "./Basic.sol";

contract Login is Basic{

  bytes32 trackingId;

  function verify(string info,string productId) returns (bool){
    trackingId = items[productId];
    ProofEntry acOwner = proofs[trackingId];
    bytes32 newKey = keccak256(info);
    if(newKey == acOwner.privateKey)
    {
      return true;
    }
    else {
      return false;
    }
  }

  function getTrackingId(string productId) constant returns (bytes32){
  trackingId = items[productId];
  return trackingId;
  }

}
