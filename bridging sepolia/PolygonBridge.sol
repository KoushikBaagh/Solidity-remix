// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Our contract is both an ERC20 token and has an owner.
contract PolygonWeth is ERC20, Ownable {

    // When deploying, we set the token name ("Wrapped Ether"), symbol ("WETH"),
    // and the owner (the address deploying the contract).
    constructor() ERC20("Wrapped Ether", "WETH") Ownable(msg.sender) {}

    /**
     * @notice Creates new WETH tokens.
     * Only the contract owner (our backend script) can call this function.
     * @param to The address to send the new tokens to.
     * @param amount The amount of tokens to create.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /**
     * @notice Destroys a user's tokens.
     * This will be used for the bridge back to Ethereum later.
     * @param amount The amount of WETH to burn from the caller's balance.
     */
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}