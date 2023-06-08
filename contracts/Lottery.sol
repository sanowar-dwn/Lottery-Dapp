// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

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

    function getEntranceFee() public view returns(uint) {
        (, int answer , , ,) = ethUsdPriceFeed.latestRoundData();

        uint256 convertedPrice = uint256(answer) * 10**10; //18 decimals

        uint entryCost = (uint(EntryFee) * 10**18 ) / uint(answer);

        return entryCost;
    }

    function startLottery() public {}

    function endLottery() public {}


}