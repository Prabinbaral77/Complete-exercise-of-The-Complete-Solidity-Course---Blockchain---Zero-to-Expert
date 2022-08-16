// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
  Function: group of reuseable code that we can used anywhere in the program.
  function takes the input of information and produce output.
  function functionName(parameter list) scope returns() {
    ...statement
  }  
  scope is a visibility. either private, public, internal and external
 */


/* 
   Pseudo thought code experiment
   door - variable
   remoteControlOpen: open the door;  - function
   remoteControlClose: close the door;  - function
 */


 /*
    view indicates that the function will not alter the storage state in any way. But it allows you to "view" it

    pure is even more strict, indicating that it will not even read the storage state.
  */


 contract ControlSystem {
    bool public isDoorOpen;

    function remoteControlOpen() public {
        isDoorOpen = true;
    }

    function remoteControlClose() public {
        isDoorOpen = false;
    }

    //local variable superseed(overlapped) state variable
    //uint sum = 10; //state variable
    //create a function that add two variable
    function addNumber(uint num1, uint num2) public pure returns(uint) {
      //all the variable we write into the function remain localized inside function scope.
      uint sum = num1 + num2;  //here sum is local variable
      return sum;
    }


    uint num = 5;
    //exercise: create the function which performs multiplication.
    function multiplyCalculator(uint num1, uint num2) public pure returns(uint) {
      uint result = num1 * num2;
      return result;
    }

    function divideCalculator(uint num1) public view returns(uint) {
      uint result = num1 / num;
      return result;
    }
 }

