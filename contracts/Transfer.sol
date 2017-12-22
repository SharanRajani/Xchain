pragma solidity ^0.4.4;

import "./Basic.sol";

contract transfer is Basic{

function transferProof(string newTrackingId, string trackingId, string privateKey, address newOwner)public returns(bool success) {

if (keccak256(trackingId) != keccak256("root")) {
  if (hasProof(trackingId)) {
    ProofEntry memory pe = getProofInternal(trackingId);
    if (msg.sender != pe.owner) {
      return false;
    }
  }

      if (hasProof(newTrackingId)) {
        // already exists- return
        return false;
      }

  proofs[newTrackingId].owner = newOwner;
  proofs[newTrackingId].privateKey=privateKey;
  proofs[newTrackingId].previousTrackingId=trackingId;
  transferCompleted(msg.sender, newOwner, newTrackingId, trackingId, proofs[newTrackingId].previousTrackingId);
  return true;

}
}
}
