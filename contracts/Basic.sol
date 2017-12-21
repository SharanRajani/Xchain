pragma solidity ^0.4.4;

import "./Mortal.sol";

contract Basic is Mortal {
  struct ProofEntry {
    address owner;
    string privateKey;
    string previousTrackingId;
  }

  // map of trackingId to proofEntry
  mapping (string => ProofEntry) private proofs;

  event TransferCompleted(
    address from,
    address to,
    string trackingId,
    string previousTrackingId
  );


  function Basic() {

  }

  // returns true if proof is stored
  function hasProof(string trackingId) constant internal returns(bool exists) {
    return proofs[trackingId].owner != address(0);
  }


  // returns the proof
  function getProofInternal(string trackingId) constant internal returns(ProofEntry proof) {
    if (hasProof(trackingId)) {
      return proofs[trackingId];
    }

    // proof doesn't exist, throw and terminate transaction
    throw;
  }

  function getProof(string trackingId) constant returns(address owner, string privateKey, string previousTrackingId) {
    if (hasProof(trackingId)) {
      ProofEntry memory pe = getProofInternal(trackingId);
      owner = pe.owner;
      privateKey = pe.privateKey;
      previousTrackingId = pe.previousTrackingId;
    }
  }

  // returns the encrypted part of the proof
  function getprivateKey(string trackingId) constant returns(string privateKey) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).privateKey;
    }
  }

  function getOwner(string trackingId) constant returns(address owner) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).owner;
    }
  }

  function getPreviousTrackingId(string trackingId) constant returns(string previousTrackingId) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).previousTrackingId;
    }
  }
}
