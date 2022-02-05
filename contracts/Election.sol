// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint votes;
    }

    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates; // Cannot be iterated, and has no way to determine the size

    // Store Candidates count
    uint public candidateCount;
    
    // Constructor
    constructor () {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    // No one else but the contract can add the candidates
    // Hence, make it private
    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }
}