// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
/*
ABSTRACT CONTRACTS

Abstract Contract is one which contains at least one function without any implementation. 
Such a contract is used as a base contract. 
Generally an abstract contract contains both implemented as well as abstract functions. 
Derived contract will implement the abstract function and use the existing functions as and when required.

Alert:if only function which has no implementation when we deploy we see this warning and cannot deploy but can be base contract.
This contract may be abstract, it may not implement an abstract parent's methods completely or it may not invoke an inherited
contract's constructor correctly.
*/

//Base
// abstract contract Base {
//     //since the function has no implementation we should mark it as virtual
//     function y( ) public view virtual returns(string memory);
// } 

contract Base {
    //since the function has no implementation we should mark it as virtual
    function y( ) public view virtual returns(string memory) {}
} 

//derived
contract Derived is Base {
    function y() public view override virtual returns(string memory){
        return "Hello";
    }
}

//technically the contract is still abstract because of atleast one function without body or implementation.
//if we namly specify the contract is abstract by removing the curly braces from no body function 
//then the contract is non deployable. otherwise if has other usaable function and contract is not decleared abstract 
//specifically  then we can deploy easily.
//base contract
abstract contract Member {
    string name;
    uint age = 38;

    //because the function setName has no body the contract is now abstract.
    function setName() public view virtual returns(string memory);

    function returnAge() public view returns(uint) {
        return age;
    }
}

//derived contract
contract Teacher is Member {
    function setName() public pure override returns(string memory) {
        return "Prabin";
    }
}

/*
Exercise:
1. Create an abstract base contract called Calculator with a read only public function that returns integers 
2. Create a derived contract called Test which derives the Calculator contract and can calculate 1 + 2 and return the result 
*/

abstract contract Calculator {
    function x() public view virtual returns(uint);
}

contract Test is Calculator {
    function x() public pure override returns(uint) {
        uint result =   1 + 2;
        return result;
    }
}