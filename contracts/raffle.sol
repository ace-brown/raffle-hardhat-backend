// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

// Errors =====================================================================
error Raffle__notSufficientFund();

// Raffle Contract ############################################################
contract Raffle {
    // Variables ===============================================================
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    // constructor () ===========================================================
    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    // enterRaffle () ===========================================================
    function enterRaffle() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__notSufficientFund();
        }

        s_players.push(payable(msg.sender));
    }

    // Getter functions ==========================================================

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }

    function getPlayers(uint256 index) public view returns (address) {
        return s_players[index];
    }
}

// ================================================================
