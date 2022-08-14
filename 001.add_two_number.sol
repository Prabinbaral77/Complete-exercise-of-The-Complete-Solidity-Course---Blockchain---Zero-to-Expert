// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract addNumber {

    //add the two integer
    function sumofTwoNumber(uint a, uint b) public pure returns(uint) {
        uint sum = a + b;
        return sum;
    }
}