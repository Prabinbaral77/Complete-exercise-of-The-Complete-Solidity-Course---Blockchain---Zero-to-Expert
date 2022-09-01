// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
   OPERATOR:
     Symbol that tell the compiler or interpreter to perform the specific mathmatical, relational or logical operation and produce final result.

     Arithmatic operator: + - / * %
     Comparision Operator: = > < 
     Logical Operator: ! == 
     Assignment operator: = ie a=b ie a is assigned the value of b

      Operands: variables
      Operator: symbol

      
THE MODULO CALCULATION TRICK (finding the remainder)

    1. divide the dividend (first number) by the divisor (second number)
    2. disregard the fraction in the result.
    3. multiply the result (quotient) by the divisor (second number)
    4. subtract the new result from the divident (first number)
    
    A. 12 % 23 - the goal is to find the remainder 
    1. dividend = 12, divisor = 23 
    2. q = 12 / 23, q = 0 
    3. 0 * 23 = 0, newResult = 0 
    4. R = 12 - 0, R = 12 


    B. 112 % 35 = R 
    1. dividend = 112, divisor = 35 
    2. q = 3
    3.  newResult = 3 * 35, newResult = 105 
    4. R = 112 - 105, R = 7 

    C. 8 % 3 = R 
    1. dividend = 8, divisor = 3
    2. q = 2
    3.  newResult = 2 * 3, newResult = 6 
    4. R = 8 - 6, R = 2 


    Start by choosing the initial number (before performing the modulo operation). 
    Let's say it is 250. This is our dividend.
    Choose the divisor. Let's pick 24. The operation we want to calculate is then 
    250 mod 24 (250 % 24 if using different convention).
    Divide one number by the other, rounding down: 250 / 24 = 10. T
    his is the quotient. Also, you can think of that operation as an integer division - 
    the type of the division, where we don't care about the fractional part of the result.
    Multiply the divisor by the quotient. So it's 10 * 24 = 240 in our example.
    Subtract this number from your initial number (dividend). Here: 250 - 240 = 10.
    The number you obtain is the result of the modulo operation. We can write it down as 250 mod 24 = 10.
 */


 contract ArithmaticOperators {
   function calculator() public pure returns(uint) {
     //if 5/7 then it returns 0  
     uint a = 10; 
     uint b = 15;
     return b % a;
   }

// a = 2 b = 12 
  
  // ARITHMETIC EXERCISES 
  // 1. a + b - b + a = ?
  // 2 + 12 - 12 + 2 = 4
  
  // 2. a * b * b - 1 = ?
  //  2 * 12 * 12 - 1 = 287
  
  // 3. b + b++ + a++ = ?
  // 12 + 13 + 3 = 28
  
  // 4. (b % a) + 3 = ? 
  
  // (12 % 2) + 3 = 3
  
 }


contract ComparisionOperator {
  uint a = 14;
  uint b = 4;

  function compare() public view  {
   // < less then
    // require(a < b, "a is greater then b so we cannot execute this task.");
    // require(a > b, "b is greater then a so we cannot execute this task.");
    // require(a == b, "must be equal");
    // require(a != b, "must be unequal");
    //only run the function if b is equal to a or less
    require(a <= b, "false condition");
  }
}


contract LogicalOperator {
  // operator: &&, ||, !
  uint a = 4;
  uint b = 5;


  function logic() public view returns(uint) {
    uint result;

    if(a < b && a ==4) { //both condition must be true
      result = a + b;
    }

    if(a < b || a == 40) { //either of these two condition must be true
      result = a + b;
    }
    return result;
  }

   // Exercise: 
    // 1. Create a function which will multiply a by b and divide the result by b
    // 2. Only return the multiplication of the function if b is greater than a AND a does not equal b 
    // 3. initialize a = 17 and b to 32 

    function multiply() public pure returns(uint) {
      uint aa = 17;
      uint bb = 32;
      uint result;
      if(bb > aa && aa != bb) {
        result = aa * bb;
      }
      return result;
    }
}


contract AssignmentOperator {
  uint a = 5;
  uint public b = 10;
  

  function assignedOperator() public view returns(uint) {
    uint c = 2;
    return c += c + b;
  }
  
}


// Final Operators Exercise 
// 0. create a contract called final exercise (FinalExercise)
// 1. initialize 3 state variables a, b, f 
// 2. assign each variable the following: a should equal 300, b should equal 12,
// and f should equal 47
// 3. create a function called finalize that is public and viewable which returns 
// a local variable d 
// 4. ininitialize d to 23 
// 5. return d in short handed assignment form to multiply itself by itself and then 
// subtracted by b 
// 6. bonus make the function conditional so that it will only return the multiplcation if
// a is greather than or equal to a and b is less than f otherwise d should return 23


contract FinalExercise{
  uint a = 300;
  uint b = 1200;
  uint f = 47;

  function finalize() public view returns(uint) {
    // require(a >= b && b < f, "condition unmatched");
    uint d = 23;
    if(a >= b && b < f) {
    return d *=  d - b;
    }
    return  d;
  }
}

