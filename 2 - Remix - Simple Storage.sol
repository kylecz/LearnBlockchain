// SPDX-License-Identifier: MIT 
    // license identifier

// Ctrl+S to run the compiler

// TYPES
    // https://docs.soliditylang.org/en/latest/types.html
    // boolean (true, false), uint (whole number that is only positive), int, address, string, bytes
    // used to define variables
        // we can add bytes after to state how big that number can get; uint256, int8

// FUNCTIONS (METHODS)
    // self-contained modules that execute some subset of code when called
    // 'Deploy and Run Transactions' tab used to deploy to a test JavaScript VM engine
        // we can use this test local blockchain, with these fake accounts that have 100 Eth, to test our contracts
        // when we click 'Deploy', we are sending a transaction; any time we change something on-chain, including creating a new contract, it send a transaction
        // Visibility - external or internal view https://docs.soliditylang.org/en/v0.7.3/contracts.html#visibility-and-getters

pragma solidity 0.8.8;
    // ^0.8.8 tells the compiler that any version above 0.8.8 will work
    // >=0.8.8 <0.9.0

contract SimpleStorage {  // sort of like a Class like in OOP
    uint256 public funNumber;  // initialized to zero
    
    // function called 'store', takes some parameter, and will set the funNumber variable to some number that we pass
    // 'Deploy and Run Transactions' > click 'Deploy' > ...
    // add a value to the 'store' function, click 'store' > we call the contract which does cost some gas
    // initially, we cannot see the output until we add 'public' before the variable name (Visibility)
    function store(uint256 _funNumber) public {  
        funNumber = _funNumber;
    }


}  