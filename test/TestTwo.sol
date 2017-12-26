pragma solidity ^0.4.4;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Main.sol";

contract TestTwo {
function testBacktracking(){
  Main m = Main(DeployedAddresses.Main());
  m.addProduct("xyz@gmail.compassword123","1235");
  bytes32[128] array;
  array[2] = m.fetchOwnerHash("xyz@gmail.compassword123");
  m.registerUser("arbc@gmail.compassword123");
  array[1] = m.fetchOwnerHash("arbc@gmail.compassword123");
  m.transfer(array[1],"xyz@gmail.compassword123","1235");
  m.registerUser("rrty@gmail.compassword123");
  array[0] = m.fetchOwnerHash("rrty@gmail.compassword123");
  m.transfer(array[0],"arbc@gmail.compassword123","1235");
  bytes32[128] memory ownerAddresses;
  uint count;
  uint flag=0;
  (ownerAddresses,count)= m.track("1235");
  for(uint i=0;i<count;i++)
  {
    if(array[i]!=ownerAddresses[i])
    {
      flag=1;
      break;
    }
  }
  Assert.equal(flag , 0, "Backtracking UnSuccessful!");
}
}
