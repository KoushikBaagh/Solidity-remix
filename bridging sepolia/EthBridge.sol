// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EthBridge {

    // Event to notify our backend that ETH has been locked.
    event ETHLocked(
        address indexed user, // The person who sent the ETH.
        uint256 amount        // The amount of ETH they sent.
    );

    // This function is the entry point.
    // 'payable' is a special keyword that allows this function to receive ETH.
    // Anyone can call this and send their ETH to be locked.
    function lock() public payable {
        // We require that some amount of ETH was actually sent.
        require(msg.value > 0, "Cannot lock 0 ETH.");

        // msg.sender = The address of the user calling the function.
        // msg.value  = The amount of ETH (in wei) they sent along.
        emit ETHLocked(msg.sender, msg.value);
    }
}