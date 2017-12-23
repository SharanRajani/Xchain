pragma solidity ^0.4.4;

import "./Basic.sol";
import "./Login.sol";
import "./TransferOwnership.sol";

contract Transfer is Basic{

  function transfer(bytes32 newOwner,string info,string productId){
<<<<<<< HEAD
    if(verify(info,productId)==true){
    transferProof(proofs[trackingId].owner,proofs[trackingId].previousTrackingId, newOwner);
=======
    if(verify(string info,string productId)==true){
    transferProof(proofs[trackingId].owner,proofs[trackingId].previousTrackingId, newOwner, productId);
>>>>>>> 24d85a04c4ad8c57245873f1e0a1ec51c61b4d96
    }
  }
}
