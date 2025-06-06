// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Kirat is ERC20,Ownable{

    constructor () ERC20("Kirat","KIR") Ownable(msg.sender){}

    function mint(address _account, uint256 amount) public onlyOwner {
        _mint(_account, amount);
    }

}