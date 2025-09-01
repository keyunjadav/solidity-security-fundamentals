// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MissingOnlyOwner {
    address public owner = msg.sender;
    function setOwner(address newOwner) external { owner = newOwner; } // ❌ no onlyOwner
}
