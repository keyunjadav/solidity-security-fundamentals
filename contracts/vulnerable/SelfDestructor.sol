// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SelfDestructor {
    function boom(address payable to) external {
        selfdestruct(to); // ❌ anyone can kill and force-send ETH in older EVMs
    }
}
