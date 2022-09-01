// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
   VARIABLE SCOPE:   -Function and variable
   Private:  you can only call the function inside the contract.
   Public: You can call the function from outside the smart contract as well as inside the contract.
   Internal: called only within the contract or other contract that inherit the smart contract.
   External: You can call the function only from outside from the contract not from inside the contract.
 */


 contract Scope {
   uint public data = 10; //state variable

   function X() external pure returns(uint) {
     uint data1 = 25;  //local variable
     return data1;
   }


   function Y() public view returns(uint) {
     return data;
   }
 }

