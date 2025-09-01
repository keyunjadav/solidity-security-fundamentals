// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

contract PermitStable is ERC20Permit {
    constructor() ERC20("PermitStable", "PST") ERC20Permit("PermitStable") {}
    // Using EIP-2612 permit avoids approve front-running patterns
}
