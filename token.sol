// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KoushikCoin{
    address public owners;
    mapping (address => uint) public balances;
    uint public totalSupply = 0;
    string public coinName = "KoushikCoin";
    string public symbol = "KKK";
    constructor() {
        owners = (msg.sender);
    }


function mint_create(uint amount) public {
    require(owners == msg.sender);
    balances[owners] += amount;
    totalSupply += amount;
}

function mintTo(uint amount, address _to) public {
    require (owners == msg.sender);
    balances[_to] += amount;
    totalSupply += amount;

}

function transfer(uint amount, address _to) public {
    uint existingBalances = balances[msg.sender];
    require(existingBalances>=amount);
    balances[msg.sender] -= amount;
    balances[_to] += amount;

}

}