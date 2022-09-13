// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*   
 Event
 --Event is a inheritable member of the smart contract.An event is emitted, it stores the argument passed in the transactions logs.
 --These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain.
 example:
 Abstraction: Decentralized exchange: on the smart contract traders can trade tokens from the smart contract emit an event
 so they can get the data(web front moble)
 
 after emitting an event you cann`t read them in the past only for entities outside of the blockchain - not stored as memory
 event have lower gas costs than storage.
*/

contract LearnEvent {
    //1. declare the event(camelcase is good convention for event name)
    //2. emit an event
    //indexed allows the outside consumer to filter through and find the required information but its going to costs higher gas.
    //only use 3 indexed at most per event.
    event NewTrade (
        uint indexed time,  
        address from,
        address indexed to,
        uint indexed amount
    );

    function trade(address _to, uint _amount) external  {
        //outside consumer can see the event through web3js
        emit NewTrade(block.timestamp, msg.sender, _to, _amount);
    }
} 