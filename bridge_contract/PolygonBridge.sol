// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// OpenZeppelin's Ownable such that certain functions 
// must be called only by the contract owner.
// ERC20 is the token standard.
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PolygonBridge is ERC20, Ownable {
    constructor () ERC20("Wrapped Ether", "WETH") Ownable(msg.sender)
    {}

    function mint(address _to, uint256 _amount) public onlyOwner{
        _mint(_to, _amount);
    }

        function burn(uint256 _amount) public{
        _burn(msg.sender,_amount);
    }
}