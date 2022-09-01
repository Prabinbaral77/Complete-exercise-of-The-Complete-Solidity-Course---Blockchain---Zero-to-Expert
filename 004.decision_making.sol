// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
  DECISION MAKING
  while writing a program there may be the situation in which you need to adopt the one out of the given set of path.
   --if the user has the right password then let the user in
   --if the user enter the wrong password then dont let them in
 */


 contract DecisionMaking {
  uint oranges = 5; //one equal sign = assign value and two equal value == use for comparision

  function validateOranges() public view returns(bool) {
    if (oranges == 5) {   //whatever goes parenthesis evaluate the trueness
      return true;
    } else{
      return false;
    }
  }



//exercise on defi
   uint public stakingWallet = 10;

   function airDrop() public returns(uint) {
     if(stakingWallet == 10) {
       stakingWallet += 10;
     } else {
       stakingWallet += 1;
     }

     return  stakingWallet;
   }
 }
