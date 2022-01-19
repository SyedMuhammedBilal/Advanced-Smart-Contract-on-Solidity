// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyWallet {
    address public owner = msg.sender;

    event Deposit(uint amount);
    event Withdraw(uint amount);

    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external payable {
        require(msg.sender == owner, "Permission Denied");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}