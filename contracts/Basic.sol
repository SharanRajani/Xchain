pragma solidity ^0.4.4;

import "./Mortal.sol";

contract Basic is Mortal {
  struct ProofEntry {
    bytes32 owner;
    bytes32 privateKey;
    bytes32 previousTrackingId;
  }
  struct registerEntry{
    bytes32 owner;
    bytes32 privateKey;
  }

  bytes32 root = keccak256("root");
  //'root', variable of the type bytes32 stores
  //hash of the word "root"

  // map of trackingId to proofEntry
  mapping (bytes32 => ProofEntry) proofs; // trackingId to ownerBlock
  mapping (string => bytes32) items;  // productId to trackingId
  mapping (bytes32 => registerEntry) register; // ownerHash to registerEntry

  event transferCompleted(
    bytes32 from,
    bytes32 to,
    bytes32 trackingId,
    bytes32 previousTrackingId
  );


  function Basic() {

  }

  // returns true if proof is stored
  function hasProof(bytes32 trackingId) constant internal returns(bool) {
    if(proofs[trackingId].owner != "")
    {
      return true;
    }
    else {
      return false;
    }
  }

  function getRoot() constant internal returns (bytes32) {
    return root;
  }

  // returns true if entry exist
  function hasEntry(string productId) constant internal returns(bool) {
    bytes32 check = items[productId];
    if(check == "")
    {
      return false;
    }
    else {
      return true;
    }
  }

  // returns the proof
  function getProofInternal(bytes32 trackingId) constant internal returns(ProofEntry proof) {
    if (hasProof(trackingId)) {
      return proofs[trackingId];
    }

    // proof doesn't exist, throw and terminate transaction
    throw;
  }

  function getProof(bytes32 trackingId) constant internal returns(bytes32 owner, bytes32 privateKey, bytes32 previousTrackingId) {
    if (hasProof(trackingId)) {
      ProofEntry memory pe = getProofInternal(trackingId);
      owner = pe.owner;
      privateKey = pe.privateKey;
      previousTrackingId = pe.previousTrackingId;
    }
  }

  function getRecord(string productId) constant returns(bytes32,bytes32,bytes32) {
    bytes32 trackingId = items[productId];
    ProofEntry memory record = proofs[trackingId];
    return (record.owner,record.privateKey,record.previousTrackingId);
  }


  // returns the encrypted part of the proof
  function getprivateKey(bytes32 trackingId) constant internal returns(bytes32 privateKey) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).privateKey;
    }
  }

  function getOwner(bytes32 trackingId) constant internal returns(bytes32 owner) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).owner;
    }
  }

  function getPreviousTrackingId(bytes32 trackingId) constant internal returns(bytes32 previousTrackingId) {
    if (hasProof(trackingId)) {
      return getProofInternal(trackingId).previousTrackingId;
    }
  }

}
