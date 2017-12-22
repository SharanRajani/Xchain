pragma solidity ^0.4.4;

import "./Basic.sol";
import "./Login.sol";
import "./TransferOwnership.sol";

contract Transfer is Basic{

  function transfer(bytes32 newOwner){
    if(verify()==true){
    transferProof(proofs[trackingId].owner,proofs[trackingId].previousTrackingId, newOwner);
    }
  }
}
