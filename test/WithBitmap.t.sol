// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/WithBitmap.sol";

contract WithBitmapTest is Test {
    WithBitmap public bitMaps;

    address[] addresses;

    function setUp() public {
        bitMaps = new WithBitmap();
        for (uint i = 0; i < 5000; i++) {
            addresses.push(vm.addr(i + 1));
        }
    }

    function testAddToBitMapNoOZ() public {
        for (uint i = 0; i < 10; i++) {
            bitMaps.claimTokens(addresses);
        }
    }

    function testAddressAdded() public {
        addresses.push(vm.addr(1));
        bool hasClaimedBefore = bitMaps.hasClaimed(vm.addr(1));
        assertFalse(hasClaimedBefore);
        bitMaps.claimTokens(addresses);
        bool hasClaimedAfter = bitMaps.hasClaimed(vm.addr(1));
        assertTrue(hasClaimedAfter);
    }
}
