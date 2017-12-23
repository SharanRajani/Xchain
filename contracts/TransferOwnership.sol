pragma solidity ^0.4.4;

import "./Basic.sol";
import "./Encrypted.sol";


contract TransferOwnership is Basic, encrypted{

  function transferProof(bytes32 owner, bytes32 previousTrackingId, bytes32 newOwner)public returns(bool success) {

    bytes32 trackingId=keccak256(bytes32toString(previousTrackingId));
    bytes32 newTrackingId=keccak256(bytes32toString(trackingId));

    if (keccak256(trackingId) != keccak256("root")) {
      if (hasProof(trackingId)) {
        ProofEntry memory pe = getProofInternal(trackingId);

      }

      if (hasProof(newTrackingId)) {
        // already exists- return
        return false;
      }

    proofs[newTrackingId].owner = newOwner;
    proofs[newTrackingId].privateKey=register[newOwner].privateKey;
    proofs[newTrackingId].previousTrackingId=trackingId;
    transferCompleted(owner, newOwner, newTrackingId, proofs[newTrackingId].previousTrackingId);
    return true;

   }
  }
 }
