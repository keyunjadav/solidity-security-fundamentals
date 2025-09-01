// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/access/Ownable.sol";

contract WithOnlyOwner is Ownable {
    constructor() Ownable(msg.sender) {}
    function setOwner(address newOwner) external onlyOwner { _transferOwnership(newOwner); }
}
