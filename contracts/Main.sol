pragma solidity ^0.4.4;

import "./Basic.sol";
import "./Backtracking.sol";
import "./Encrypted.sol";
import "./Login.sol";
import "./Transfer.sol";
import "./TransferOwnership.sol";


contract Main is Basic,Backtracking,encrypt,Login,Transfer,TransferOwnership {
  
}
