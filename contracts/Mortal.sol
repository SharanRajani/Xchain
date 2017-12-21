pragma solidity ^0.4.0;

contract Mortal{
    address owner;

    function mortal(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        if(msg.sender==owner)
        {
            _;
        }
    }

    function kill() onlyOwner {
        selfdestruct(owner);
    }

}
