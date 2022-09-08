// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
  VIEW AND PURE
  View function ensure that they will not modify the state.(return values)
  Pure function ensure that they not read or modify the state.(return calculation)
*/

contract MyContract {
    uint value;

    function setValue(uint _value) external {
        value = _value;
    }

    function getValue() external view returns(uint) {
        return value;
    }

    function gettValue() external pure returns(uint) {
        return 3 + 3;
    }

    function multiply() public pure returns(uint) {
        return 3 *7;
    }

    function valuePlusThree() public view returns(uint) {
        return value + 3;
    }
}

/* 
Exercise: 
1. create a function called multiply which returns 3 multiplied by 7 
2. create another fuction called valuePlusThree which returns the state variable value + 3 
3. sucessfully deploy the contracts and test for the results.
***Remember*** to use the appropriate modifying keywords accordingly!!!!!!!
*/