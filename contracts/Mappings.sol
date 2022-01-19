// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Mapping {
    uint public roomNo = 0;
    mapping(uint => string) public HotelRooms;

    function addRooms(string memory _name) external {
        HotelRooms[roomNo++] = _name;
    }
}