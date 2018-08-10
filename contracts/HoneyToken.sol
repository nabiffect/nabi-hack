pragma solidity ^0.4.15;

import 'openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract HoneyToken is StandardToken {
    uint public INITIAL_SUPPLY = 2500000;
    string public name = 'HoneyToken';
    string public symbol = 'HNY';
    uint8 public decimals = 8;
    address owner;

    function HoneyToken() public {
        totalSupply_ = INITIAL_SUPPLY * 10 ** uint(decimals);
        balances[msg.sender] = INITIAL_SUPPLY;
        owner = msg.sender;
    }

    function transfer(address to, uint256 value) public returns (bool) {
        super.transfer(to, value);
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        super.allowance(owner, spender);
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        super.transferFrom(from, to, value);
    }

    function approve(address spender, uint256 value) public returns (bool) {
        super.approve(spender, value);
    }
}