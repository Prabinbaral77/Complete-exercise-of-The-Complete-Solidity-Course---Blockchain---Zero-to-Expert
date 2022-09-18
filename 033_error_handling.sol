// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/* 

ERROR HANDLING!!!!

Solidity has functions that help with error handling 
A way of tackling this is that when an error happens, the state reverts back to its original state. 
Below are some of the important methods for error handling:


    assert(bool condition) − In case condition is not met, this method call causes an 
    invalid opcode and any changes done to state got reverted. This method is to be used for internal errors.

    require(bool condition) − In case condition is not met, this method call reverts to original state. 
    - This method is to be used for errors in inputs or external components.

    require(bool condition, string memory message) − In case condition is not met, this method call reverts to original state. 
    - This method is to be used for errors in inputs or external components. It provides an option to provide a custom message.

    revert() − This method aborts the execution and revert any changes done to the state.

    revert(string memory reason) − This method aborts the execution and revert any changes done to the state. 
    It provides an option to provide a custom message.
*/

contract ErrorHandling {
    bool public sunny = true;
    uint finalCalc = 0;
    bool public umberalla = false;

    function solarCalc() public {
        require(sunny, "It is not sunny today!");
        finalCalc += 3;
        assert(finalCalc != 6);
    }

    //finalCalc never equal 6
    function internalTestUnit() public view {
        assert(finalCalc != 6);
    }

    function changeWheather() public  {
        sunny = !sunny;
    }

    //getFinalCalc
    function finalCalcc() public view returns(uint) {
        return finalCalc;
    }

    function bringUmbrella() public {
        if(!sunny) {
            umberalla = true;
        }else {
        revert("No need umberella today"); 
        }
    }
}

/*
Exercise - 
1. Create a contract called Vendor with the state variable address seller. 
It should contain a modifier onlySeller that requires the msg.sender to be the seller.
2. Add a function becomeSeller which sets the seller to the msg.sender.
3. Create a function named sell which is payable and checks so see 
if an input of an amount is greater than the msg.value and in the event
to revert that there is not enough ether provided as a throw error. 
*/

contract Vendor {
    address seller;

    modifier onlySeller() {
        require(msg.sender == seller);
        _;
    }

    function becomeSeller() public {
        seller = msg.sender;
    }

    function sell(uint _value) public payable onlySeller {
        if(msg.value  < _value) {
            revert("Not Enough ether provided.");
        }
    }
}