// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract WithoutBitmap {
    mapping(address => bool) public claimedAddreses;

    function claimTokens(address[] calldata _addresses) external {
        for (uint256 i = 0; i < _addresses.length; ++i) {
            claimedAddreses[_addresses[i]] = true;
        }
    }
}
