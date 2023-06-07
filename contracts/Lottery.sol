// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Lottery {
    address payable[] public players;
    uint256 public EntryFee;
    AggregatorV3Interface internal ethUsdPriceFeed;

    constructor(address _pricefeedAddress) public{
        EntryFee = 50 * (10 ** 18); // USD -> Wei Conversion *Minimum Fee 0f USD 50*
        ethUsdPriceFeed = AggregatorV3Interface(_pricefeedAddress);
    }

    function enter() public payable {
        players.push(msg.sender);
    }

    function GetEntranceFee() public view returns(uint256) {}

    function startLottery() public {}

    function endLottery() public {}


}