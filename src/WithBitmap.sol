// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract WithBitmap {
    uint256 public claimedBitmap;

    function claimTokens(address[] calldata recipients) external {
        for (uint256 i = 0; i < recipients.length; i++) {
            address recipient = recipients[i];
            uint256 mask = uint256(1) << (uint256(uint160(recipient)) % 256);
            if ((claimedBitmap & mask) == 0) {
                claimedBitmap |= mask;
                // Transfer tokens to recipient
            }
        }
    }
}
