// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
 The contract allows only its creator to create the new coin (difference issuance schemes are possible)
 AnyOne can send the coin to each other without a need of registering username and password. All we need is ethereum keypair.
*/


contract Coin {
    address public minter;
    mapping(address => uint) public balances;

    //Event is a inheritable member of the smart contract.An event is emitted, it stores the argument passed in the transactions logs.
    //These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain.
    event Send(address _sender, address _receiver, uint amount);

    constructor() {
        minter = msg.sender;
    }

    //make the coin and send it to the address;
    //only owner can send these coins
    function mint(address _address, uint amount) public {
        require(msg.sender == minter, "Only minter can access this function.");
        balances[_address] += amount;
    }

    error insufficientBalance(uint requested, uint available); 

    function send(address _receiver, uint _amount) public {
        // require(_amount <= balances[msg.sender], "sending amount is not enough in you wallet.");
        if(_amount > balances[msg.sender] ){
            revert insufficientBalance({
                requested: _amount,
                available: balances[msg.sender]
            });
        }
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;
        emit Send(msg.sender, _receiver, _amount);
    }
}
