// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// import "forge-std/Test.sol";
import "../src/WithBitmapOZ.sol";

contract WithBitmapOZ {
    BitMaps public bitMaps;

    function setUp() public {
        bitMaps = new BitMaps();
    }

    function testAddToBitMap() public {
        for (uint i = 0; i < 15; i++) {
            bitMaps.addToBitmap(i);
        }
    }
}
