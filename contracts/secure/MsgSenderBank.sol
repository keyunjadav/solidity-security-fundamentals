// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MsgSenderBank {
    address public owner = msg.sender;
    function withdrawAll(address payable to) external {
        require(msg.sender == owner, "not owner"); // ✅ use msg.sender
        to.transfer(address(this).balance);
    }
    receive() external payable {}
}
