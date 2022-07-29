// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol";

contract Allowance is Ownable {

    mapping(address => uint) public allowance;

    function addAllowance(address _who, uint amount) public onlyOwner {
        allowance[_who] = amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        require(msg.sender == owner() || allowance[msg.sender] >= _amount, "You are not allowed!");
        _;
    }

    function reduceAllowance(address _who, uint _amount) internal ownerOrAllowed(_amount) {
        allowance[_who] -= _amount;
    }
}

contract SharedWallet is Ownable, Allowance {

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {

        require(_amount <= address(this).balance, "Contract doesn't own enough money");
        if (msg.sender != owner()) {
            reduceAllowance(msg.sender, _amount);
        }
        _to.transfer(_amount);
    }

    receive () external payable {
    }
}