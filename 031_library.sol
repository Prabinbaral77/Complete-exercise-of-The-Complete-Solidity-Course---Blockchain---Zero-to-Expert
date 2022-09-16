// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
/*

Libraries are similar to Contracts but are mainly intended for reuse. A Library contains functions which other contracts can call. 
Solidity have certain restrictions on use of a Library. Following are the key characteristics of a Solidity Library.

    Library functions can be called directly if they do not modify the state. 
    That means pure or view functions only can be called from outside the library.

    Library can not be destroyed as it is assumed to be stateless.

    A Library cannot have state variables.

    A Library cannot inherit any element.

    A Library cannot be inherited.

*/

library Search {
    //we want to loop to return the index of integer in an array
    function indexOf(uint [] storage self, uint _value) public view returns(uint index) {
        for(uint i =0; i< self.length; i++) if(self[i] == _value) return i;
    }
}

contract Library {
    // using A (library) for B (another element) 
    uint [] public data;
    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function getIndex(uint _value) public view returns(uint) {
        uint value = _value;
        return Search.indexOf(data, value);
    }
}

/*

The directive using A for B; can be used to attach library functions of library A to a given type B.
These functions will use the caller type as their first parameter (identified using self).

Exercise: 
1. Copy over the library Search and the contract Test below
and rename library Search to Search2 and contract Test to Test2. 

2. Using the A for B library pattern assign the new library to an empty array type 
and
rewrite the code so that we can run the same search hardcoded this time to the value of 4
accordingly.  
*/

library Search2 {
    //we want to loop to return the index of integer in an array
    function indexOf(uint [] storage self, uint _value) public view returns(uint index) {
        for(uint i =0; i< self.length; i++) if(self[i] == _value) return i;
    }
}

contract Test2 {
    // using A (library) for B (another element) 
    using Search2 for uint[];
    uint [] public data;
    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function getIndex() public view returns(uint) {
        uint value = 4;
        return data.indexOf(value);
    }
}