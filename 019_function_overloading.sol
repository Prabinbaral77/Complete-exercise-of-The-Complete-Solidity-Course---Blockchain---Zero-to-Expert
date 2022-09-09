// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/* 
Function Overloading:

You can have multiple definitions for the same function name in the same scope. 
The definition of the function must differ from each other by the types and/or the number of arguments in the argument list. 
You cannot overload function declarations that differ only by return type.

*/

contract FunctionOverLoading {

    function x(bool success, uint wallet) public {

    }

    function x(uint reward) public {

    }

    /*
    Exercise: 
    1. Create two functions with the same name that return the sum of their arguments - 
    2. One function which takes two arguments and another function which takes three arguments. 
    3. Create two additional functions which can call each sum function and return their various sums. 
    4. Successfully deploy your contract and test the results of overloading functions! 
    */

    function sum(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    function sum(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a + _b + _c;
    }

    function getSumOfTwoNumber() public pure returns(uint) {
        return sum(2, 3);
    }

    function getSumOfThreeNumber() public pure returns(uint) {
        return sum(5, 10, 15);
    }
}