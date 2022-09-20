// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
It is time to test your skills and the knowledge you have gained going through this course from start to finish!

Your mission is to write a decentralized auction DApplication which can at the minimum have the following functionality.
As long as you meet the minimum required functionality then you have passed this course with flying colors, however should you choose to exceed
the minimum and continue to expand upon the Auction then you are truly becoming a defi super star and I would love to see what you 
come up with so please share it in the discord! 

If you fall short - do not worry, take your time, ask questions in our Discord, do some research, and go as far as you can. And when you 
are ready go to the solution video and we can go through it all together as always. 

Final Exercise: Create an Auction DApplication (The Decentralized Ebay)

1. You must create a contract called auction which contains state variables to keep track of the beneficiary (auctioneer), 
the highest bidder, the auction end time, and the highest bid. 

2. There must be events set up which can emit whenever the highest bid changes both address and amount and an 
event for the auction ending emitting the winner address and amount. 

3. The contract must be deployed set to the beneficiary address and how long the auction will run for. 

4. There should be a bid function which includes at the minimum the following: 

a. revert the call if the bidding period is over.
b. If the bid is not higher than the highest bid, send the money back.
c. emit the highest bid has increased 

4. Bearing in mind the withdrawal pattern, there should be a withdrawal function 
to return bids based on a library of keys and values. 

5. There should be a function which ends the auction and sends the highest bid to 
the beneficiary!

Alirght - so this is your mission - good luck and may the defi be with you! 
*/

contract Acution {
   address public beneficiary;
   address public highestBidder;
   uint endTime;
   uint public highestBid;
   bool end;
   mapping (address => uint) public bidder;

   event highestBidIncreased(address bidder, uint amount);
   event auctionEnd(address winner, uint amount);

   constructor(address _beneficiary, uint _time) {
       beneficiary = _beneficiary;
       endTime = block.timestamp + _time;
   }

   function bid() public payable {
       if(block.timestamp > endTime) revert("bidding period is over");
       if(msg.value <= highestBid) revert("Insufficient amount to bid");
       if(highestBid != 0) {
            bidder[msg.sender] += msg.value;
       }
       highestBidder = msg.sender;
       highestBid = msg.value;
       emit highestBidIncreased(msg.sender, msg.value);
   }

   function withdrawal() public payable returns(bool success) {
       uint amount = bidder[msg.sender];
       if(bidder[msg.sender] == 0) revert("You cannt withdraw the bidding amount");
       bidder[msg.sender] = 0;
       if(!payable(msg.sender).send(msg.value)){
           bidder[msg.sender] = amount;
       }
       return true;
   }

   function endAuction() public {
       if(block.timestamp < endTime) revert("the auction has not ended yet!");
       if(end) revert("Auction already over");
       end = true;
       emit auctionEnd(highestBidder, highestBid);
       payable(beneficiary).transfer(highestBid);
   }

   function getContractBalance() public view returns(uint) {
       return address(this).balance;
   }

}