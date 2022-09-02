// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
  STRING:
   they are the ordered sequences of characters such as "hello world". A string contain any
   sequence of character ie visible or invisible and character may be repeated.
   It can either be grouped by double quote(") or single quote(')
   To skip the character in solidity we use the backspace(\) in front of character.
   To skip the line in solidity use (\n)

*/

/*
  MEMORY AND STORAGE:
    Memory in solidity is a temporal place to store data.
    Storage holds the data between function call and is persistant.

    The Solidity Smart Contract can use any amount of memory during the execution 
    but once the execution stops, the Memory is completely wiped off for the next execution.
*/


 contract String {
   string greeting = "Hello";  //here Hello is the string literals and greeting is the name of the string and string is a datatype.
   string public greetingNep = 'Namsthya you\'re here now';
   string public greet = 'namstya, \nwhat\'s popping';


   function sayHello() public view returns(string memory) {
     return greeting;
   }

   function changeGreeting(string memory _value) public {
     greeting = _value;
   }

//string are two expansive computationally to get the length in solidity so you cannt do it like other langauge. so we convert 
// it to the bytes because working with bytes in general saves the computation expenses as opposed to string
   function getChar() public view returns(uint) {
    //  return greeting.length; //not possible
    //convert string to byte, we can return the length.
    //bytes are the basic unit of measurement in computer processing.

    bytes memory stringToBytes = bytes(greeting);
    return stringToBytes.length;
   }



   // Exercises with Strings:
    
    // 1. create a string called favoriteColor
    // 2. set the favorite color of the string favoriteColor to blue 
    // 3. create a function which returns the string literal of favoriteColor
    //4 . create a function which changes the favoriteColor string literal from blue to your favorite color.
    //5 . create a function which can return how many characters there are in the string favorite color 
 
  string favoriteColor = "blue";

  function stringLiteral() public view returns(string memory) {
    return favoriteColor;
  }

  function changeColor(string memory _color) public {
    favoriteColor = _color;
  }

  function charCount() public view returns(uint) {
    bytes memory colorToBytes = bytes(favoriteColor);
    return colorToBytes.length;
  }
}
