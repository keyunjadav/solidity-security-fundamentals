// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract OverflowToken {
    mapping(address => uint256) public balanceOf;
    function mint(uint256 amount) external { balanceOf[msg.sender] += amount; }
    function transfer(address to, uint256 amount) external {
        // ❌ incorrect unchecked subtraction enabled by developer
        unchecked { balanceOf[msg.sender] -= amount; }
        balanceOf[to] += amount;
    }
}
