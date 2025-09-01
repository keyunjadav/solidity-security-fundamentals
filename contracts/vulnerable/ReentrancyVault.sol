// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ReentrancyVault {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "insufficient");
        // ❌ EFFECTS after INTERACTION -> vulnerable
        (bool ok,) = msg.sender.call{value: amount}("");
        require(ok, "send failed");
        balances[msg.sender] -= amount;
    }
}
