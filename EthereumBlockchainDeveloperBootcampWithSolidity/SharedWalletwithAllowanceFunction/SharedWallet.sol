// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract SharedWallet {

    address public owner;

    constructor() internal {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed");
        _;
    }

    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }
    
    receive () external payable {
    }
}