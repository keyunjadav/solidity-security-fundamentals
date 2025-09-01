// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PredictableRandom {
    // ❌ predictable: miners/MEV can influence block attributes
    function win() external view returns (bool) {
        return (uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % 2) == 0;
    }
}
