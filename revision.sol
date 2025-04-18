// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sum {
    uint256 public a = 23;
    uint256 public b = 34;
    uint256 public add = a+b;
    function result() public view returns (uint256)
    {
        return add;
    }
}