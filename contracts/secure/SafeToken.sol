// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract SafeToken {
    using SafeMath for uint256;
    mapping(address => uint256) public balanceOf;
    function mint(uint256 amount) external { balanceOf[msg.sender] = balanceOf[msg.sender].add(amount); }
    function transfer(address to, uint256 amount) external {
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(amount, "insufficient");
        balanceOf[to] = balanceOf[to].add(amount);
    }
}
