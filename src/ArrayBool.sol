// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ArrayListDemo {
    bool[] public myListOfBools;

    function addToList(bool _newItem) external {
        myListOfBools.push(_newItem);
    }
}
