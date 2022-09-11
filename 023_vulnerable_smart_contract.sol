// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/* what do you think is the problem with the returnFunds function? 

1.What if the owner chickens out and does not return funds?
The owner is a single point of failure and this pattern 
suggests adherence to server-centric thinking — 
only a privileged user should be able to initiate a mass distribution of funds.

2. the loop is unbound! it could very well run out of gas before allocating all the funds back
an attacker could do is just make a bunch of small contributions .0000284289

Another example: We only have two investors to refund - 

Write a function that will return funds to two investors, john and tatianna without using a for loop!

function returnFunds() public onlyOwner returns(bool success) {
tatiana.transfer(contributedAmount); 
john.transfer(contributedAmount);
return true;
}

*/


/* What could go wrong?
What happens if Tatianna rejects the transfer? If Tatianna rejects the transfer
the function is going to fail and then John will not get paid!!!

Thinking that all contracts and accounts want to accept funds automatically may be 
intuitive at first but it is in fact very naive and very dangerous to build your code like this

If it is more in their interest to reject funds then chances are they will reject the funds 

write a fallback function 

fallback () external payable {}

// a default fallback function is not payable - it will reject funds 

// if one contract has a default fallback function it would be deadly for the naive contract  
// to refund this contract address - it will not work unless everyone accepts. It will fail. 

// Should we disallow contracts to recieve funds? 
// Because not all contracts will fail or are mailcious - it would deter DAOs 

// How does a contract find out if another address is a contract? 

}

*/

contract Victim {
    function isItAContract() public view returns(bool) {
        //if there bytes of code is greater then zero then it is a contract.
        uint32 size;
        address a = msg.sender;
        // interact with EVM which is not recommended to do
        //access the assembly of EVM
        //inline assembly access the EVM ethereum virtual machine at a low level.
        assembly{
            size := extcodesize(a)  //extcodesize retrives the size of code.
        }
        return(size > 0);
    }
}

contract Attacker {
    bool public trickedYou;
    Victim victim;

    constructor(address _v) {
        victim = Victim(_v);
        trickedYou = !victim.isItAContract();
    }
}
//when we pass addresss of victim through constructor of attacker the boolean trickedYou 
//returns true and shows it has not any bytes of code inside this address
//if you call the address from the constructor then there are no bytescode.
//what to do: WITHDRAWAL PATTERN