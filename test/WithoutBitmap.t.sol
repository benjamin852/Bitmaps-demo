// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/WithoutBitmap.sol";

contract WithoutBitmapTest is Test {
    WithoutBitmap public noBitmap;

    address[] addresses;

    function setUp() public {
        noBitmap = new WithoutBitmap();
    }

    function testClaimTokensNoBitMap() public {
        for (uint i = 0; i < 500_000; i++) {
            addresses.push(vm.addr(i + 1));
        }
        for (uint i = 0; i < 10; i++) {
            noBitmap.claimTokens(addresses);
        }
    }
}
