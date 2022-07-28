// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract SimpleMappingExample {
    mapping(uint => bool) public myMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    mapping(address => bool) public myAddressMapping;

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}