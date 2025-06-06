// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// We need ERC20 for the token functionality and Ownable to control minting.
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract ERC20Bridge is ERC20, Ownable {

    // Event to notify the backend that tokens have been locked.
    event TokensLocked(
        address indexed token,      // address of the token that was locked.
        address indexed from,       // user who locked the tokens.
        uint256 amount              // The amount locked.
    );

    constructor() ERC20("KoushikToken", "KTK") Ownable(msg.sender) {}


    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

 
    function lock(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");

        // // `transferFrom` This function transfers `amount` of tokens from the `msg.sender` (the user)
        // // to `address(this)` (this contract itself).
        // // This will only succeed if the user has previously approved the contract
        // // to spend at least `amount` of their tokens.
        // bool success = transferFrom(msg.sender, address(this), amount);
        // require(success, "ERC20: transferFrom failed. Did you approve first?");

        // Instead of transferFrom(...), we use _transfer(...) directly.
        // This moves `amount` tokens from msg.sender to this contract, without needing prior approval.
        _transfer(msg.sender, address(this), amount);

        // Emit the event for node.js to see.
        // `address(this)` is the address of the KTK token itself.
        emit TokensLocked(address(this), msg.sender, amount);
    }
}