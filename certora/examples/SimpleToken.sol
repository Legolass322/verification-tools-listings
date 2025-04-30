// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SimpleToken {
    mapping(address => uint256) public balances;
    uint256 public totalSupply;
    string public name;
    string public symbol;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _initialSupply
    ) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply; // Give initial supply to deployer
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_to != address(0), "ERC20: transfer to the zero address");
        require(
            balances[msg.sender] >= _value,
            "ERC20: transfer amount exceeds balance"
        );

        balances[msg.sender] -= _value;
        balances[_to] += _value; // Potential overflow here if not using SafeMath/checked arithmetic (Solidity 0.8+ handles this)

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}
