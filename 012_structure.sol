  // SPDX-License-Identifier: GPL-3.0

  pragma solidity >=0.7.0 <0.9.0;

  /* 
  //Struct are types that are used to represent a record. Suppose you want to keep track of your movies in a library. 
  // You might want to track the following attributes about each movie −
  library of information
  */

 
  contract StructLearn{
   struct Movie {
     string title;
     string director;
     uint id;
   }

   Movie public movie;
   Movie public comedy;

   function createMovie() public {
     movie = Movie("Aama", "Dipendra K khanal", 25);
   }

   function getMovieId() public view returns(uint) {
     return movie.id;
   }

    function getComedyMovieId() public view returns(uint) {
     return comedy.id;
   }

   function setComedyMovie(string memory _title, string memory _director, uint _id) public {
     comedy = Movie(_title, _director, _id);
   }



   // 1. create a new movie and set it up so that it updates to the movie in the setMovie function
  // 2. return the id of the new movie
  // 3. create a new var called comedy and set up comedy to the datatype Movie 
  //4. update the setMovie function with a comedy movie that contain name, director, and an id
  //5. return the movie id of the comedy. 

  }
