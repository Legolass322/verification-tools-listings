// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SafeCounter {
    uint256 public count;

    // Invariant: count should never exceed 100
    modifier checkInvariant() {
        _;
        assert(count <= 100); // Property we want to verify
    }

    function increment() public checkInvariant {
        require(count < 100, "Counter cannot exceed 100");
        count++;
        // The checkInvariant assertion runs *after* the state change
    }

    function get() public view returns (uint256) {
        return count;
    }
}
