pragma solidity ^0.4.4;

import "./Basic.sol";

contract encrypt is Basic {

    function addProduct(string password, string productId) public {

        bytes32 ownerHash = keccak256(bytes32ToString(keccak256(password)));
        bytes32 privateKeyHash =  keccak256(password);
        bytes32 previousTrackingId = keccak256("root");
        bytes32 trackingId = keccak256(productId);
        proofs[trackingId] = ProofEntry(ownerHash, privateKeyHash, previousTrackingId);
        // return (ownerHash,privateKeyHash,previousTrackingId,trackingId);
    }
    function registerUser(string password) public {
        bytes32 owner = keccak256(bytes32ToString(keccak256(password)));
        bytes32 privateKey = keccak256(password);
        register[owner] = registerEntry(owner , privateKey);
    }

    function fetchOwnerHash(string password) public pure returns (bytes32){
        bytes32 owner = keccak256(bytes32ToString(keccak256(password)));
        return owner;
    }




    function bytes32ToString(bytes32 x) pure internal returns (string) {
    bytes memory bytesString = new bytes(32);
    uint charCount = 0;
    for (uint j = 0; j < 32; j++) {
        byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
        if (char != 0) {
            bytesString[charCount] = char;
            charCount++;
        }
    }
    bytes memory bytesStringTrimmed = new bytes(charCount);
    for (j = 0; j < charCount; j++) {
        bytesStringTrimmed[j] = bytesString[j];
    }
    return string(bytesStringTrimmed);
}

}
