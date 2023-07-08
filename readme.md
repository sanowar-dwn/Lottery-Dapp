# Lottery Contract Documentation

The `Lottery` contract allows participants to join a lottery by contributing a specific amount of Ether. The lottery is managed by a designated manager who can pick a winner and distribute the prize.

Interact with this contract via [Etherscan](https://sepolia.etherscan.io/address/0x1F65312E129DBeBe306163210D170248a0F8b85b#code) using the contract address "0x1F65312E129DBeBe306163210D170248a0F8b85b" in the Seploia Test Net.


## Contract Overview

- Contract Name: Lottery
- Solidity Version: ^0.7.0
- License: MIT


## Public State Variables

### players

- **Type**: Array
- **Value Type**: address payable

An array that stores the addresses of all participants who joined the lottery by contributing Ether.

### winner

- **Type**: address payable

The address of the winner who is randomly picked by the manager.

### manager

- **Type**: address payable

The address of the manager who oversees the lottery and performs administrative functions.

### totalFunds

- **Type**: uint256

The total amount of Ether accumulated from the participants' contributions.

### isLotteryOpen

- **Type**: bool

A boolean flag indicating whether the lottery is currently open for participation.


## Modifiers

### onlyManager

A modifier that restricts access to functions only to the manager of the lottery.


## Public Functions

### participate

- **Parameters**: None
- **Payable**: Yes

Allows a participant to join the lottery by sending 1 ETH as payment. The participant's address is added to the `players` array, and the `totalFunds` variable is incremented.

### pickWinner

- **Parameters**: None

Randomly selects a winner from the `players` array and transfers the majority (80%) of the totalFunds to the winner's address. The remaining funds are transferred to the manager. After picking a winner, the `players` array is reset, and the `totalFunds` variable is set to zero. The lottery is then closed.

### getBalance

- **Parameters**: None
- **Returns**: uint256

Returns the current balance of the lottery contract.

### getPlayers

- **Parameters**: None
- **Returns**: address payable[]

Returns an array of addresses representing the participants who joined the lottery.

### getManager

- **Parameters**: None
- **Returns**: address

Returns the address of the manager overseeing the lottery.

### getWinner

- **Parameters**: None
- **Returns**: address payable

Returns the address of the winner of the lottery.

### endLottery

- **Parameters**: None

Closes the lottery and destroys the contract, transferring any remaining funds to the manager's address. Only the manager can call this function.

### reopenLottery

- **Parameters**: None

Reopens the lottery for participation. Only the manager can call this function.

