// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Commit-reveal scheme (VRF recommended for production).
contract CommitReveal {
    mapping(address => bytes32) public commit;
    function submitCommit(bytes32 c) external { commit[msg.sender] = c; }
    function reveal(uint256 secret, bytes32 salt) external view returns (bool) {
        require(commit[msg.sender] == keccak256(abi.encodePacked(secret, salt)), "bad reveal");
        return secret % 2 == 0;
    }
}
