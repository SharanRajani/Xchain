pragma solidity ^0.4.4;

import "./Basic.sol";

contract Backtracking is Basic {

  function track(string itemId) returns (bytes32[128] ownerAddresses,uint count) {
    uint count=0;
    bytes32[128] ownerAddresses;
    bytes32 trackingId = items[itemId];
    bytes32 root = getRoot();
    while( trackingId != root )
    {
      ProofEntry p1= proofs[trackingId];
      trackingId = p1.previousTrackingId;
      ownerAddresses[count++]=p1.owner;
    }
    count--;
  }

}
