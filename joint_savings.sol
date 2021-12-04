/*
Joint Savings Account
---------------------
1. Create and work within a local blockchain development environment using the JavaScript VM provided by the Remix IDE.
2. Script and deploy a **JointSavings** smart contract.
3. Interact with your deployed smart contract to transfer and withdraw funds.\
*/

// Instructions: Define a new contract named `JointSavings`

/*Define the following variables:
- Two variables of type `address payable` named `accountOne` and `accountTwo`
- A variable of type `address public` named `lastToWithdraw`
- Two variables of type `uint public` named `lastWithdrawAmount` and `contractBalance`.
*/

/*
Define a function named **withdraw** that will accept two arguments.
- A `uint` variable named `amount`
- A `payable address` named `recipient`
*/

//Define a `require` statement that checks if the `recipient` is equal to either `accountOne` or `accountTwo`. The `requiere` statement returns the text `"You don't own this account!"` if it does not.
// Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
// Set  `lastWithdrawAmount` equal to `amount`
// Define a `public payable` function named `deposit`.  
// Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance` to reflect the new balance of the contract.
//Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
//Finally, add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.


pragma solidity ^0.5.0;

contract JointSavings {
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;
    
    function withdraw(uint amount, address payable recipient) public {
        require((recipient == accountOne) || (recipient == accountTwo), "You don't own this account");
        require(amount <= contractBalance, "There are insufficient funds in this account!");

        if(lastToWithdraw != recipient){
            lastToWithdraw = recipient;
        }
        
        recipient.transfer(amount);
        lastWithdrawAmount = amount;
        contractBalance = address(this).balance;
        }
    function deposit() public payable {
        contractBalance = address(this).balance;
    }
    function setAccounts (address payable account1, address payable account2) public{
        accountOne = account1; 
        accountTwo = account2; 
    }
    function() external payable {}
}