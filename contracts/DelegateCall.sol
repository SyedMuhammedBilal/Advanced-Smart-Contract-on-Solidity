// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestDelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }    
}

contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;
    bytes public data;

    function setVars(address _test, uint _num) external payable {
        // _test.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
        (bool success, bytes memory _data) = _test.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );
        data = _data;
        require(success, "Deletgate Call Failed");
    }
}