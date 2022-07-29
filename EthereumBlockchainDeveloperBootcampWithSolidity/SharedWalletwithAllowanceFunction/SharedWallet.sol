// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";

contract SharedWallet is Ownable, Allowance {

    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {

        require(_amount <= address(this).balance, "Contract doesn't own enough money");
        if (msg.sender != owner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }

    function renounceOwnership() public view override onlyOwner {
        revert("can't renounceOwnership here"); //not possible with this smart contract
    }

    receive () external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}