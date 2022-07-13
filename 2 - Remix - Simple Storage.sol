// SPDX-License-Identifier: MIT 
    // license identifier

// CTRL+S to run the compiler

// TYPES
    // https://docs.soliditylang.org/en/latest/types.html
    // used to define variables
    // boolean (true, false), uint (whole number that is only positive), int, address, string, bytes
        // we can add bytes after to state how big that number can get; e.g. uint256, int8

// 1. FUNCTIONS (METHODS)
    // self-contained modules that execute some subset of code when called
    // 'Deploy and Run Transactions' tab used to deploy to a test JavaScript VM engine
        // we can use this test local blockchain, with these fake accounts that have 100 Eth, to deploy and test our contracts
        // any time we change something on-chain, including creating a new contract or calling a function, a transaction is sent and some gas is paid
    // Visibility - https://docs.soliditylang.org/en/v0.7.3/contracts.html#visibility-and-getters
        // 'public' - will create a 'getter' function that returns the value of the variable
        // 'private' - only this contract can call this function
        // 'external' - only an external source can call this function
        // 'internal' - only this contract can call this function
            // *this is the default if we do not specify a visibility
    // scope - when we create a function, it can only be referenced in the scope of where it was defined (i.e. in the curly brackets {})
    // 'view' and 'pure' functions, when called, do NOT spend gas; they also disallow any modification of state
        // 'view' - reads state from contract
        // 'pure' - disallows you to read from state
        // *if a gas calling function calls a 'view' or 'pure' function, then it will cost gas
    // *orange buttons run transactions, blue buttons do not (they do not cost any gas, they are not assigned a hash value)
    // 'returns' - answers, what is this function going to give us after we call it? (i.e. give us a uint256)

// 2. ARRAYS & STRUCTS
    // what if we want to store a range of objects
    // 'struct' - allows us to create a new 'type'
    // 'array' - data structure; way to store a list of many types (type + visibility + variable name)

pragma solidity 0.8.8;
    // ^0.8.8 tells the compiler that any version above 0.8.8 will work
    // >=0.8.8 <0.9.0

contract SimpleStorage {  // sort of like a Class like in OOP

    // 1. a)
    // variable - include 'type', 'visibility', variable name
    uint256 public funNumber;  // initialized to zero

    // 1. b)
    // create a function (called 'store'), that takes some parameter (_funNumber), and let's set our variable (funNumber) to whatever parameter we decide to pass
    // click 'Compile' (CTRL+S), then 'Deploy' contract..
    function store(uint256 _funNumber) public {  
        funNumber = _funNumber;
    }
    // output:
        // input a value to the 'store' form, click the orange 'store' button > click the blue'funNumber' variable to output the uint256 number 
        // *each time we call the contract, it costs some gas
        // *larger functions cost more gas

    // 1. c)
    // we can create a function that return the value of funNumber
    // this function mimics the 'public' visibility function
    // *'view' function does NOT cost any gas; we are simply reading from the contract
        // *if a different function called this retrieve function, then yes, there would be a cost
    function retrieve() public view returns(uint256){
        return funNumber;
    }


    // 2. a)
    // create a new 'type', using a 'struct' that stores 2 values
    // now we can use this new People 'type' and assign it to a variable (2. b))
    struct People {
        uint256 funNumber;
        string name;
    }

    // 2. b)
    // we can do exactly what we did before (1. a)) but now use our new People type (e.g. instead of uint256)
    // let's create variable called 'person' using the People type
    // since were using a struct, we need to use '{}'
    //////People public person = People({funNumber: 2, name: "Kyle"});
    // output:
        // gives us a getter function (blue button called 'person') with two values; uint256: funNumber at index 0, string: name at index 1
            // *when you create lists, they get indexed
    // if you have many people to define, it may become cumbersome 
    //////People public person2 = People({funNumber: 7, name: "Emma"});
    // so let's create an 'array' (2. c))

    // 2. c)
    // create an 'array'; (same idea as before) specify array type (People[]), visibility, and variable name (people)
    People[] public people;
        // output:
            // gives us a form to fill out; if we input anything, nothing will actually happen because our people list is empty
        // so we need to create a function that will add people to our array (2. d))
        // *People[] is called a 'dynamic array' since the size isnt specified; if we add a number within the brackets, then that would specify the size of the array

    // 2. d)
    // let's add people to the array that we've defined above
    // create a function (addPerson), include inputs (_name, _funNumber)
    // create a type People variable (newPerson) and include inputs within the {} (just like we saw in 2. b))
        // *if we dont include 'memory', then we will receive an error: "Data location must be storage, memory, or calldata for variable"
    // call the 'push' function to add to our 'people' array
    function addPerson(string memory _name, uint256 _funNumber) public {
        People memory newPerson = People({funNumber: _funNumber, name: _name});
        people.push(newPerson);
        // *another way to do this:
        // create a new People object (our struct) that will take in the inputs (_funNumber, _name) and then add ('push') them to the 'person' (array)
        ////people.push(People(_funNumber, _name));
    }
    // output:
        // input into the addPerson form (string _name, uint256 _funNumber; John, 9) and click on the orange addPerson button
        // input into the people form (uint256; 0) and click on the blue people button
            // output for the 0 index should be John, 9

}  
