// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IERC20 { function transferFrom(address from, address to, uint256 amount) external returns (bool); }
contract BadERC20Spender {
    function pull(address token, address from, uint256 amount) external {
        // Users mistakenly approve(this) unlimited allowance; we can drain.
        IERC20(token).transferFrom(from, msg.sender, amount);
    }
}
