  // SPDX-License-Identifier: GPL-3.0

  pragma solidity >= 0.7.0 < 0.9.0;

// Ether Units
// Ethereum is the blockchain and Ether is the currency for Ethereum 

contract learnEtherUnits {
    
    function test() public pure {
    
    // wei is the smallest denomination of ether 
    // assert is a keyword and it check what inside is true or not. 
    //If it is true it is going to let the transaction run else(not true) its going to distroy our function
    assert(1000000000000000000 wei == 1 ether); // 10^18 wei = 1 eth
    // assert(1 wei == 1); // 1 wei = 1 
    
    assert(1 ether == 1e18);
    // 1 ether == 1e18
    // create an assertion for 2 eths to be equivalent to weis
    assert(2 ether == 2000000000000000000 wei); 
    }
    
    
    function exercise() public pure {
      // assert(1 minutes == 60 seconds);

      // assert(24 hours == 1440 minutes);

      // assert(1 days == 24 hours);

      // assert(1 weeks == 7 days);
    }  
}


// Similar to currency, Solidity has time units where lowest unit is second and we can use seconds, 
// minutes, hours, days and weeks as suffix to denote time.

// Exercise - Create the following assertions in a function called exercise:
// Assert equivalencies for minutes to seconds, hours to minutes, days to hours, and weeks to days