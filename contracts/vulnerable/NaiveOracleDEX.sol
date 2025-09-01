// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IERC20X { function balanceOf(address) external view returns (uint256); }

contract NaiveOracleDEX {
    address public token;
    constructor(address _token){ token = _token; }
    // ❌ price equals token balance in pool (manipulable by temporary liquidity moves)
    function price() public view returns (uint256) {
        return IERC20X(token).balanceOf(address(this));
    }
}
