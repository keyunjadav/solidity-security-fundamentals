// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract NaiveDividend {
    address[] public holders;
    mapping(address => uint256) public balance;
    function addHolder(address a) external { holders.push(a); }
    function deposit() external payable {}
    function payout() external {
        uint256 share = address(this).balance / holders.length;
        for (uint256 i; i < holders.length; i++) {
            (bool ok,) = payable(holders[i]).call{value: share}("");
            require(ok, "failed"); // ❌ one revert blocks all
        }
    }
}
