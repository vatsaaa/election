// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Election {
    // Store candidate name
    // Read candidate name
    string public candidate;
    // Constructor
    constructor () {
        // Initialize candidate name
        candidate = "Candidate 1";
    }
}