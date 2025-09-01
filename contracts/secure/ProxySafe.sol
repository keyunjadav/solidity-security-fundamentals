// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ProxySafe {
    address public owner;
    address public lib;
    mapping(bytes4 => bool) public allowed;

    constructor(address _lib){ owner = msg.sender; lib = _lib; }

    function setAllowed(bytes4 sig, bool isAllowed) external {
        require(msg.sender == owner, "not owner");
        allowed[sig] = isAllowed;
    }

    fallback() external payable {
        require(allowed[msg.sig], "selector not allowed");
        (bool ok,) = lib.delegatecall(msg.data);
        require(ok, "delegate failed");
    }
}
