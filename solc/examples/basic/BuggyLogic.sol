// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract BuggyLogic {
    uint256 public x;
    uint256 public y;

    constructor() {
        x = 0;
        y = 20;
    }

    // Intention: x should always remain less than y
    // Bug: If amount is large enough, x can become > y
    function increaseX(uint256 amount) public {
        // Forget to check if amount is too large relative to y
        x = x + amount;
        assert(x <= y); // This property can be violated!
    }
}
