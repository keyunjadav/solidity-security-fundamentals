// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PullDividend {
    address[] public holders;
    mapping(address => uint256) public credit;

    function addHolder(address a) external { holders.push(a); }
    function deposit() external payable {}
    function snapshot() external {
        uint256 share = address(this).balance / holders.length;
        for (uint256 i; i < holders.length; i++) {
            credit[holders[i]] += share;
        }
    }
    function claim() external {
        uint256 amt = credit[msg.sender];
        credit[msg.sender] = 0;
        (bool ok,) = payable(msg.sender).call{value: amt}("");
        require(ok);
    }
}
