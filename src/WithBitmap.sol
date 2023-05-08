// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract WithBitmap {
    uint256 public claimedBitmap;

    function claimTokens(address[] calldata _recipients) external {
        for (uint256 i = 0; i < _recipients.length; i++) {
            address recipient = _recipients[i];
            uint256 mask = uint256(1) << (uint256(uint160(recipient)) % 256);
            if ((claimedBitmap & mask) == 0) {
                claimedBitmap |= mask;
                // Transfer tokens to recipient
            }
        }
    }

    function hasClaimed(address _claimer) external view returns (bool) {
        uint256 mask = uint256(1) << (uint256(uint160(_claimer)) % 256);
        if ((claimedBitmap & mask) == 0) {
            // has not yet claimed
            return false;
        } else {
            // has already claimed
            return true;
        }
    }
}
