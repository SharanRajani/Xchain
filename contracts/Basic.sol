pragma solidity ^0.4.4;

import "./Mortal.sol";

contract Basic is Mortal {
  struct ProofEntry {
    bytes32 owner;
    bytes32 privateKey;
    bytes32 previousTrackingId;
  }
  bytes32 root;
  root = keccak256("root");
  //'root', variable of the type bytes32 stores
  //hash of the word "root"

  // map of trackingId to proofEntry
  mapping (bytes32 => ProofEntry) proofs;
  mapping (string => bytes32) items;

  event transferCompleted(
    address from,
    address to,
    bytes32 trackingId,
    bytes32 previousTrackingId
  );


  function Basic() {

  }

  // returns true if proof is stored
  function hasProof(bytes32 trackingId) constant internal returns(bool exists) {
    return proofs[trackingId].owner != address(0);
  }


  // returns the proof
  function getProofInternal(bytes32 trackingId) constant internal returns(ProofEntry proof) {
    if (hasProof(trackingId)) {
      return proofs[trackingId];
    }

    // proof doesn't exist, throw and terminate transaction
    throw;
  }

  function getProof(bytes32 trackingId) constant returns(address owner, bytes32 privateKey, bytes32 previousTrackingId) {
    if (hasProof(trackingId)) {
      ProofEntry memory pe = getProofInternal(trackingId);
      owner = pe.owner;
      privateKey = pe.privateKey;
      previousTrackingId = pe.previousTrackingId;
    }
  }

  // returns the encrypted part of the proof
  function getprivateKey(bytes32 trackingId) constant returns(bytes32 privateKey) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).privateKey;
    }
  }

  function getOwner(bytes32 trackingId) constant returns(address owner) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).owner;
    }
  }

  function getPreviousTrackingId(bytes32 trackingId) constant returns(bytes32 previousTrackingId) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).previousTrackingId;
    }
  }

}
