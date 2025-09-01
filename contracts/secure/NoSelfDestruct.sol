// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract NoSelfDestruct {
    address public owner = msg.sender;
    // No selfdestruct, or restrict with onlyOwner + circuit breaker
}
