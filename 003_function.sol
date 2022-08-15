// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
  Function: group of reuseable code that we can used anywhere in the program.
  function functionName(parameter list) scope returns() {
    ...statement
  }  
 */


/* 
   Pseudo thought code experiment
   door - variable
   remoteControlOpen: open the door;  - function
   remoteControlClose: close the door;  - function
 */

 contract ControlSystem {
    bool public isDoorOpen;

    function remoteControlOpen() public {
        isDoorOpen = true;
    }

    function remoteControlClose() public {
        isDoorOpen = false;
    }
 }

