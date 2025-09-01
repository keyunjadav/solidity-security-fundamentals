// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ProxyBad {
    address public owner; // slot 0
    address public lib;
    constructor(address _lib){ owner = msg.sender; lib = _lib; }

    fallback() external payable {
        (bool ok,) = lib.delegatecall(msg.data);
        require(ok, "delegate failed");
    }
}
