// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*    Inheritance!

Inheritance is a way to extend functionality of a contract. 
Solidity supports both single as well as multiple inheritance. Following are the key highlighsts.

Observe: The contract in Solidity is similar to a Class in C++ - a blueprint for an object 

Classes can inherit and so can contracts!

    Constructor − A special function declared with constructor keyword which will be 
    executed once per contract and is invoked when a contract is created.
    
    Exercise Create two contracts A and B
    1. Contract A should have a state var called innerVal initialized to 100.
    2. Create a  fully accessible function called innerAddTen which returns 10 to any given input
    3. Contract B should inherit from contract A 
    4. Contract B should have a function called outerAddTen which returns 
    the calucaltion from innerAddTen function in Contract A to any given input
    5. Create a function in contract B which returns the value of innerVal from contract A
*/

contract A {
    uint innerVal = 100;

    function innerAddTen(uint _input) public pure returns(uint) {
        return _input + 10;
    }

}

contract B is A {
    function outerAddTen(uint _input) public pure returns(uint) {
        return innerAddTen(_input);
    }

    function getValue() public view returns(uint) {
        return innerVal;
    }
}


contract SimpleStorage {

    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

//while importing the contract to another contract 
// 1. copy and paste the contract in current solidity file
// 2. import the contract if lots of contract are required for the computation like:=        import "./filepath/filename.sol"

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray; 
    //initial contract address 0x0000.......000 after createSimpleStorageContract function is called contract address 0xrte46gdfg5..........jhg4j

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); //new deploys the contract from other contract
        simpleStorageArray.push(simpleStorage);  
    }

    function sfStore(uint _simpleStorageIndex, uint _simpleStorageNumber) public {
        //ABI = application binary interface or using address
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);

    }

    function sfGet(uint _simpleStorageIndex) public view returns(uint) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}

//if we want most of the functionalities of simplestorage smart contract without some functionalities we inherit the smart contract and 
// overrides the function in the prev contract with new implementation.
contract ExtraStorage is SimpleStorage {
    //we want to store function to add 5 to the favourite number
    function store(uint _favoriteNumber) public override {   //to override the function we need to write virtual in original function that going to override
        favoriteNumber = _favoriteNumber + 5;
    }
}
