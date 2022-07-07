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
        // any time we change something on-chain, including creating a new contract or calling a function, a transaction is sent and some gas is paid
        // Visibility - https://docs.soliditylang.org/en/v0.7.3/contracts.html#visibility-and-getters
            // 'public' - will create a 'getter' function that returns the value of the variable
            // 'private' - only this contract can call this function
            // 'external' - only an external source can call this function
            // 'internal' - only this contract can call this function (*this is the default if we do not specify a visibility)
    // scope - when we create a variable, it can only be referenced in the scope of where it was defined (i.e. in the curly brackets {})
    // 'view' and 'pure' functions, when called, do NOT spend gas; they also disallow any modification of state
        // 'view' - reads state from contract
        // 'pure' - disallows you to read from state
        // *if a gas calling function calls a 'view' or 'pure' function, then it will cost gas
        // *orange buttons run transactions, blue buttons do not (they do not cost any has, they are not assigned a hash value)

pragma solidity 0.8.8;
    // ^0.8.8 tells the compiler that any version above 0.8.8 will work
    // >=0.8.8 <0.9.0

contract SimpleStorage {  // sort of like a Class like in OOP
    uint256 public funNumber;  // initialized to zero
    
    // function called 'store', takes some parameter, and will set the funNumber variable to some number that we pass
    // 'Deploy and Run Transactions' > click 'Deploy' > ...
    // add a value to the 'store' function, click 'store' > click 'funNumber' variable ... 
        // *each time we call the contract, it costs some gas
        // *larger functions cost more gas
    function store(uint256 _funNumber) public {  
        funNumber = _funNumber;
    }

    // we can create a function that return the value of funNumber
    // this function mimics the 'public' visibility function
    // *'view' function does NOT cost any gas; we are simply reading from the contract
    function retrieve() public view returns(uint256){
        return funNumber;
    }


}  
