  // SPDX-License-Identifier: GPL-3.0

  pragma solidity >=0.7.0 <0.9.0;

  /* 
  Array:
    // WHAT ARE ARRAYS? :) 
    // Array is a data structure, which stores a fixed-size sequential collection of elements of the same type. 
    //An array is used to store a collection of data, 
    // but it is often more useful to think of an array as a collection of variables of the same type.
  */

 // 1. How To Write An Array
 // 2. pop, push, and length methods
 // 3. remove elements from array
 //pop garda array length decrease hunxa but remove garada length same as original hunxa

  contract ArrayLearn {
    uint [] public myArray;
    uint [] public myArray1;
    uint [200] public myFixedSizeArray;

     // The push() method adds one or more elements to the end of an array and returns the new length of the array.

     function push(uint _num) public {
       myArray.push(_num);
     }

      // The pop method removes the last element from an array and returns that value to the caller.
     function pop() public {
       myArray.pop();
     }

     // length is a string property that is used to determine the length of a string
     function length() public view returns(uint) {
       return myArray.length;
     }

     function remove(uint _index) public {
         // when you delete in your array the length remains the same
         //let arrry is [1, 2, 3, 4] and delete 2 index element then we get [1, 2, 0, 4]
       delete myArray[_index];
     }

      // Exercise create a function that can fully remove an item from an array
    // 1. Create an Empty array called changeArray
    // 2. Create a function called removeElement which sets the index argument of the array to the last element in the array
    // 3. remove the last index from that function with the pop method
    // 4. Create a function called test which pushes [1 2 3 4] into changeArray
    // 5. remove the element 2 from the array when the contract is called

    uint [] public changeArray;
  

    function removeElement(uint _index) public  {
      changeArray[_index] = changeArray[changeArray.length - 1]; //[1, 2, 3, 4] ===> [1,2,4,3]
      changeArray.pop();
    }

    function test() public {
      changeArray.push(1);
      changeArray.push(2);
      changeArray.push(3);
      changeArray.push(4);
    }

  function getLengthOfArray() public view returns(uint) {
    return changeArray.length;
  }
  
  }
