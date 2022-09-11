// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*

Cybersecurity In Solidity - against bad actors, accidental occurances 

Withdrawal pattern ensures that direct transfer call is not made which poses a security threat. 
Transfers are atomic (meaning all or nothing!)

Write an iterating function called returnFunds that will refund through the transfer method investors to a var 
called funders back to their wallets called contributedAmount. Add a modifier to the signature
that only the owner can execute this function. The function should return a bool success. 
*/

contract Fund{
    address owner;
    uint [] funders;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == owner, "Only owner can access this function");
        _;
    }

    function returnFunds(uint contributedAmount) public onlyAdmin returns(bool success) {
        for(uint i=0; i<= funders.length; i++) {
            // funders[i].transfer(contributedAmount);
        }
        return true;
    }
}