// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract VerifySignature {
    mapping(address => string) public Testing;

    function testNet(string memory _test) external {
        Testing[msg.sender] = _test;
    }
}

contract Dev {
    function testDevNet() external returns (string memory) {
        VerifySignature net = new VerifySignature();
        net.testNet("Testing...");
        return net.Testing(address(this));
    }
}