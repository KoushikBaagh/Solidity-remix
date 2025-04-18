// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KoushikCoin{
    address public owners;
    mapping (address => uint) public balances;
    string public coinName = "KoushikCoin";
    string public symbol = "KKK";
    constructor() {
        owners = (msg.sender);
    }
}