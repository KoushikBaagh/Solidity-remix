// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract KoushikCoin is ERC20 ,Ownable{
    constructor (uint256 initialSupply, address initialOwner) ERC20("KoushikCoin", "KKK") Ownable(initialOwner){
        // mint all tokens to the initialOwner i.e KOUSHIK
        _mint(initialOwner, initialSupply);
        // transfer ownership if you want someone else to be owner
        transferOwnership(initialOwner);
    }
    function mint(address to, uint256 amount) 
        external 
        onlyOwner 
    {
        _mint(to, amount);
    }
}