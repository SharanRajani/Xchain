pragma solidity ^0.4.4;

import "./Basic.sol";


function transferProof(string newTrackingId, string trackingId, string encryptedProof, string publicProof, address newOwner) returns(bool success) {

//if (sha3(trackingId) != sha3("root")) {
  if (hasProof(trackingId)) {
    ProofEntry memory pe = getProofInternal(trackingId);
    if (msg.sender != pe.owner) {
      return false;
    }

      if (hasProof(newTrackingId)) {
        // already exists- return
        return false;
      }

  proofs[newTrackingId] = ProofEntry(newOwner, encryptedProof, publicProof, trackingId);
  TransferCompleted(msg.sender, newOwner, newTrackingId, trackingId);
  return true;


}
