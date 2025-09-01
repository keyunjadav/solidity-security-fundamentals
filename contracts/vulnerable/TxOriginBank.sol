// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TxOriginBank {
    address public owner = msg.sender;
    function withdrawAll(address payable to) external {
        require(tx.origin == owner, "not owner"); // ❌ vulnerable
        to.transfer(address(this).balance);
    }
    receive() external payable {}
}
