// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/
contract  MyToken {
// public variables here
    string public tokenName = "siddharth";
    string public tokenAbbrv = "Awasthi"
    uint public totalSupply = 0;
  
//mapping variables here
    mapping (address => uint) public balances;
 constructor() {
        owner = msg.sender; // Set the contract deployer as the owner
    }
    
    // Modifier that only allows the owner to perform the action
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

//mint function code here increases balances
 function mint (address _address, uint _value) public onlyOwner{
   totalSupply += _value;
   balances[_address] += _value;
}
//burn function code here opposite of mint function
function burn (address _address, uint _value) public onlyOwner{
    if(balances[_address] >= _value){
       totalSupply -= _value;
       balances[_address] -= _value;
    }
  }
   function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}

