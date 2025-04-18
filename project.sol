// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract StringComparator {
    using Strings for string;

    // Method 1: Using OpenZeppelin
    function compareWithOpenZeppelin(string memory a, string memory b) public pure returns (bool) {
        return a.equal(b);
    }

    // Method 2: Length & Character Comparison
    function compareByCharacters(string memory a, string memory b) public pure returns (bool) {
        bytes memory aBytes = bytes(a);
        bytes memory bBytes = bytes(b);
        if (aBytes.length != bBytes.length) {
            return false;
        }
        for (uint i = 0; i < aBytes.length; i++) {
            if (aBytes[i] != bBytes[i]) {
                return false;
            }
        }
        return true;
    }

    // Method 3: Hash Comparison using keccak256
    function compareByHash(string memory a, string memory b) public pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}
