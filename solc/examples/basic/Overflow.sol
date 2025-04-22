// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Overflow {
    uint8 public value;

    function addUncheckedModern(uint8 input) public {
        value = value + input;
    }
}
