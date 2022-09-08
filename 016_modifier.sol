// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// function modifier are used to modify the behaviour of the function . For example to add a prerequisite to the function.
// function modifiers are customizable modification for the function.

//is is a keyword grabbing the inheritance from another contract.

contract Owner {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner  {
        //customizable logic that we require in our function.
        require(msg.sender == owner, "Only owner can access this function");
        _; //it refers if the require statement is true then it allows to continuing the function.
    }

    modifier costs(uint price) {
        require(msg.value >= price, "Require the amount greater than initial price");
        _;
    }
}

contract Register is Owner {
    mapping (address => bool) public registeredAddress;
    uint price;

    constructor(uint _initialPrice) {
        price = _initialPrice;
    }

    

    function register() public payable costs(price) {
        registeredAddress[msg.sender] = true;
    }

    function changePrice(uint _price) public onlyOwner{
        price = _price;
    }

    /* Exercise Time :) : 
        1. create a function modifier called costs for our register function that checks to see 
        that the senders value (hint look up msg.value) requires to be greater than or equal 
        to the price. Second hint: The function modifier should take an argument 
    */
 

}