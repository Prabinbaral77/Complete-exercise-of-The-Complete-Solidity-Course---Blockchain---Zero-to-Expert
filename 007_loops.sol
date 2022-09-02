// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
  LOOPS:
   allows you to iterate through data and take the functional action depending on the data.
   For loop: represent a specific block of code a known number of times.

*/


 contract Loops {

  //  function checkMultipless(uint _num1, uint _num2) public pure returns(bool) {
  //    if((_num1 % _num2) == 0) {
  //      return true;
  //    }else {
  //      return false;
  //    }
  //  }



   uint [] public numbersList = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

   function checkMultiples(uint _number) public view returns(uint) {
     uint count = 0;
     for(uint i = 0; i<= numbersList.length - 1; i++) {  //3part: initialization, conditions, to direct the index after each turn
       if ((numbersList[i] % _number) == 0 ) {
         count += 1;
       }
     }
     return count;
   }
 
 }


// Looping Practice: 

//1. create a contract myLoopingPracticeContract and place all the following code within:
// 2. create a list that ranges from 1 to 20 called longList
// 3. create a list called numbersList of the following numbers: 1, 4, 34, 56
// 4. create a function that loops through numbersList and returns a true value if the number
//  that the user inputs exists in the list otherwise it should return false 
// 5. create a function that loops trhough and returns how many even numbers there are in the long list


contract myLoopingPracticeContract {
  uint [] public longList = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
  uint [] public numberList = [1, 4, 34, 56];


  function looping(uint _num) public view returns(bool) {
    bool result;
    for(uint i= 0; i<= numberList.length - 1; i++) {
      if( numberList[i] == _num ) {
        result = true;
      } 
    }
    return result;
  }


  function findEvenLength() public view returns(uint) {
    uint count;

    for(uint i= 0; i<= longList.length - 1; i++) {
      if((longList[i] % 2 ) == 0) {
        count++;
      }
    }
    return count;
  }

}

