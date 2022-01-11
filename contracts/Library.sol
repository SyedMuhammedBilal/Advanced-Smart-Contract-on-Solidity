// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library DefaultLibrary {
    function findIndex(uint[] storage _arr, uint _index) internal view returns (uint) {
        for(uint i = 0; i < _arr.length; i++) {
            if (_arr[i] == _index) {
                return i;
            }
        }
        revert("Not Found");
    }
}

contract Testing {
    uint[] public arr = [1, 2, 3, 4];

    function findNumberFromArray(uint _index) external view returns (uint) {
        return DefaultLibrary.findIndex(arr, _index);
    }
}