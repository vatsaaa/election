// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint votes;
    }

    // Store addresses that have voted
    mapping(address => bool) public voters;

    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates; // Cannot be iterated, and has no way to determine the size

    // Store Candidates count
    uint public candidateCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );
    
    // Constructor
    constructor () {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    // No one else but the contract can add the candidates, make the function private
    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        // Check if the sender has already voted
        require(!voters[msg.sender]);

        // Require a valid candidate is voted for
        require(_candidateId > 0 && _candidateId <= candidateCount);

        // record that sender has voted
        voters[msg.sender] = true;

        // Increment the candidate's vote count
        candidates[_candidateId].votes++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}