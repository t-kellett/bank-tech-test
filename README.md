# Bank Tech Test
This is an implementation of the tech test, following these specifications:

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## How to use
* Git clone this repository and run the following commands
```
cd bank-tech-test
bundle install
irb
require '.lib/transactions'
require './lib/currentaccount'
account = CurrentAccount.new  #creates a new account with a default balance of 0 that you can deposit or withdraw from
```
* While in `irb` you can then use the methods `account.deposit(num)`, `account.withdraw(num)` and print a statement of transactions using `account.transactions.print_statement` which outputs the day a withdrawal or deposit to the console.

## Domain Model
* This was implemented across 2 classes `CurrentAccount` and `Transactions` to respect the SR principle. A domain model representing the implementation is below:
![alt text](./images/domain_model.drawio)
