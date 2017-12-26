pragma solidity ^0.4.4;

import "./Basic.sol";
import "./Encrypted.sol";


contract TransferOwnership is Basic, Encrypted{

  function transferProof(bytes32 owner, bytes32 previousTrackingId, bytes32 newOwner, string productId)public returns(bool success) {

    bytes32 trackingId;

    if (previousTrackingId != keccak256("root")) {
    trackingId=keccak256(bytes32ToString(previousTrackingId));
    }
    else
    {
    trackingId=keccak256(productId);
    }

    bytes32 newTrackingId=keccak256(bytes32ToString(trackingId));

    if (hasProof(newTrackingId)) {
    // already exists- return
     return false;
    }

    proofs[newTrackingId].owner = newOwner;
    proofs[newTrackingId].privateKey=register[newOwner].privateKey;
    proofs[newTrackingId].previousTrackingId=trackingId;
    transferCompleted(owner, newOwner, newTrackingId, proofs[newTrackingId].previousTrackingId);
    items[productId]=newTrackingId;
    return true;


  }
 }
