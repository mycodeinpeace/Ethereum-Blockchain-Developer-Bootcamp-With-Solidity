// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract SharedWallet {

    function withdrawMoney(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }
    
    receive () external payable {
    }
}