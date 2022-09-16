// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
/*

Solidity provides an option to use assembly language to write inline assembly within Solidity source code.

Assembly is a low level language that allows you to directly manipulate the EVM (more dangerous and not recommended)

EVM = smart contracts are not the real code in the blockchain - solidity code is compiled to a lower level language
 in EVM everything is stored in slots of 256 bits (a uint occupies one slot) whereas mapping or array is several
*/

contract LearnAssembly {
    function addToEvm() external pure {
        uint x;
        uint y;
        // uint z = x+y;

    //all of these compiled to low level instruction.
    assembly {
        // declares an assembly block 
        // inside we can manipulate variables declared outside 
        // no semi colon, = is actually := and we can bring in opcodes 
        let z := add(x, y)

        //load the data to specific slot.
        let a := mload(0x40)

        //store something temporarily to memory
        mstore(a, 4) //(value, payload)

        // persistant storage!
        // sstore(a, 100)

    }
 }

   function addToEvm2(address _Address) public view returns(bool success) {
       address addr = _Address;
       uint size;

       assembly {
           size := extcodesize(addr)
       }
       if(size > 0) return true;

   }

   /*
Exercise:
The function addToEVM3 is attempting to convert data bytes.
It wants to convert using Solidity a data byte into a fixed bytes size. 
However if you run the code the way it is the it will not compile successfully because
explicity type conversions are not allowed from bytes memory to bytes32. 

Use Assemby and the mload to convert the data to bytes 32 sucessfully. 
Hint: Bytes in memory size starts at second slot so 
we need to bring in the add 32 to start at the correct position.

Good luck!
*/
    
    function addToEVM3() external pure {
     bytes memory data = new bytes(10);
     
     // we cannot convert this into in a fixed size 
     // bytes32 dataB32 = bytes32(data);
     
     // but if we only care about the first 32 bytes we can use assembly! :)
     
     bytes32 dataB32;
    assembly {
        // bytes in memory is size so data actually starts at the second slot 
        dataB32 := mload(add(data, 32))
        //operation add and we add 32 bytes so we fill the first slot 
    }
     
}
}