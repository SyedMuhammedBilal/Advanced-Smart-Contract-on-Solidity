// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Call {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("Fallback is called");
    }

    function foo(string memory _message, uint _num) external payable returns (bool, uint) {
        message = _message;
        x = _num;
        return (true, 1000);
    }
}

contract CallFoo {
    bytes public data;

    function callFoo(address _test) external payable {
        (bool success, bytes memory _data) = _test.call{value: 111}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );
        require(success, "call failed");
        data = _data;
    }

    function functionNotExist(address _test) external {
        (bool success, ) = _test.call(abi.encodeWithSignature("doesNotExist()"));
        require(success, "call failed");
    }
}