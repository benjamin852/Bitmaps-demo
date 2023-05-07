// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/structs/BitMaps.sol";

contract WithBitmapOZ {
    using BitMaps for BitMaps.BitMap;

    BitMaps.BitMap private claimedBitmap;

    function claimTokens(address[] calldata recipients) external {
        for (uint256 i = 0; i < recipients.length; i++) {
            address recipient = recipients[i];
            uint256 index = uint256(uint160(recipient));
            if (!claimedBitmap.get(index)) {
                claimedBitmap.set(index);
                // Transfer tokens to recipient
            }
        }
    }
}
