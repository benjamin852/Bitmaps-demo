// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/structs/BitMaps.sol";

contract WithBitmapOZ {
    using BitMaps for BitMaps.BitMap;

    BitMaps.BitMap private claimedBitmap;

    function claimTokens(address[] calldata recipients) external {
        for (uint256 i = 0; i < recipients.length; i++) {
            address recipient = recipients[i];
            uint256 mask = uint256(1) << (uint256(uint160(recipient)) % 256);
            if (!claimedBitmap.get(mask)) {
                claimedBitmap.set(mask);
                // Transfer tokens to recipient
            }
        }
    }

    function hasClaimed(address _claimer) external returns (bool) {
        uint256 mask = uint256(1) << (uint256(uint160(_claimer)) % 256);
        if (!claimedBitmap.get(mask)) {
            //has not yet claimed
            return false;
        } else {
            //has already claimed
            return true;
        }
    }
}
