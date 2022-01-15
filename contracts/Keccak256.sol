// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Hash {

    function hashFunction(uint _num, address _address, string memory _name) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(_num, _address, _name));
    }

    // keccak256 type is (bytes32)
    function encodeFunction(string memory _name) external pure returns (bytes32)  {
        return keccak256(abi.encodePacked(_name));
    }
}