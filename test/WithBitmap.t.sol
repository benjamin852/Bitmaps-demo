// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/WithBitmap.sol";

contract WithBitmapTest is Test {
    WithBitmap public bitMaps;

    address[] addresses;

    function setUp() public {
        bitMaps = new WithBitmap();
    }

    function testAddToBitMapNoOZ() public {
        for (uint i = 0; i < 500000; i++) {
            addresses.push(vm.addr(i + 1));
        }
        for (uint i = 0; i < 10; i++) {
            bitMaps.claimTokens(addresses);
        }
    }
}
