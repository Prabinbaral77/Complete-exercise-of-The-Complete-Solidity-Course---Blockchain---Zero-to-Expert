  // SPDX-License-Identifier: GPL-3.0

  pragma solidity >=0.7.0 <0.9.0;

  /* 
  // Mapping is a reference type as arrays and structs. Following is the syntax to declare a mapping type.
  // Mapping allows you to save data and add a key that you specifiy and then retrieve that info later
  // Similar to struct or an array  -  it is a reference typr 
  // in Solidity you can't iterate through a map - you need to store the keys in an array and you can't give size
  // get set and delete a value from mapping 
  */

 
  contract LearnMapping{
   // key and value - key can be string uint or bool - value can be anything

   mapping(address => uint) public myMap;
  //  mapping(bool => uint) public myMap1;
  //  mapping(string => uint) public myMap2;

  function setAddress(address _address, uint _i) public {
    myMap[_address] = _i;
  }

  function getIndexOfAddress(address _address) public view returns(uint) {
    return myMap[_address];
  }

  function removeAddressIndex(address _address) public {
    delete myMap[_address];
  }

   // Exercise 1. Deplay the mapping contract and create some keys as addresses and set those keys to unique values 
    // 2. Remove all the addresses and check to see their updated value.

       // Mapping Assignment:
    // 0. Create a unique data type as a struct called Movie and give it the string properties: title and diretor.
    // 1. Create a map called movie which takes a uint as a key and Movie as a value 
    // 2. create a function called addMovie which takes three inputs, movie id, title and director which 
    // assigns a value of an integer to a movie added back to the movie map. It should include a title and director name.
    // 3. Deploy the contract and update the movie information to the movie map with our favorite movies! 


    struct Movie{
      string title;
      string director;
    }

    mapping(uint => mapping(address => Movie)) public movie;

    function addMovie(uint _movieId, string memory _title, string memory _director) public {
      movie[_movieId][msg.sender] = Movie(_title, _director);
    }

     // NESTED mapping (maps within maps)
    // what if you wanted to store movies that belong to a certain person, thing or address ***very important***
    // anther example - allow one address to spend on behalf of another address (ERC20 tokens)
    // ex: mapping(key =>mapping(key2 => value2)) nestedMap
  }
