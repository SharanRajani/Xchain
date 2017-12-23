pragma solidity ^0.4.4;

import "./Basic.sol";
import "./Login.sol";
import "./TransferOwnership.sol";

contract Transfer is Basic,Login,TransferOwnership{

  function transfer(bytes32 newOwner,string info,string productId){
    if(verify(info, productId)==true){
    bytes32 trackingId=getTrackingId();
    transferProof(proofs[trackingId].owner,proofs[trackingId].previousTrackingId, newOwner, productId);
    }
  }
}
