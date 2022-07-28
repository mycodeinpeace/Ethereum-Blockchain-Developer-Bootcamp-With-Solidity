pragma solidity ^0.5.13;

contract SendMoneyExample {
    uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // Withdraws all the money in the Smart Contract to the address who calls this function
    // Does no need to be a payable function because it does not receieve ether.
    function withdrawMoney() public {
        address payable to = msg.sender;

        to.transfer(this.getBalance());
    }

    // Withdraws all the money in the Smart Contract to the given address    
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }

}