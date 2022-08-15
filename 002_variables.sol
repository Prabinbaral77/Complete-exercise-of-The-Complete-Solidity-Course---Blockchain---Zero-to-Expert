// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
      variable:
      --reserved memeory location to store values.
      --when you create a variable you reserve some space in memory.
      TYPES:
      --Boolean /true or false eg: lieDetector
      --String --order sequence of charactar eg: "hello john"
      --Integer eg: walletAmount
 */

// contract Variables {

//    uint chocolateBar = 10;
//    uint storeOwner = 300;
//    bool lieDetector; //default false
//    string errorMessage = "Error, something went wrong!";

// }


//Ex-1. create new variable called wallet as integer, create boolean called spend, create a string give it a name notifySpend, initialize wallet to 500, set value of spent to false, add a string literal = "you have spent money" to notifyspend 

contract VariableExercise{
    uint wallet = 500;
    bool spend;
    string notifySpend = "You have spend money";
}
