// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract BitMaps {
    uint256 bitmap;

    function addToBitmap(uint256 index) public {
        bitmap |= (1 << index);
    }

    function isInBitmap(uint256 index) public view returns (bool) {
        return (bitmap & (1 << index) != 0);
    }
}
