// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SimpleVote {
    error AlreadyVoted();
    error InvalidCandidate();

    struct Candidate {
        string name;
        uint256 voteCount; 
    }

    Candidate[] public candidates; 
    mapping(address => bool) public hasVoted;

    constructor(string[] memory _names) {
        for(uint256 i = 0; i < _names.length; i++) {
            candidates.push(Candidate({ name: _names[i], voteCount: 0 }));
        }
    }

    function vote(uint256 _candidateIndex) public {
        if(hasVoted[msg.sender]) revert AlreadyVoted(); 
        if(_candidateIndex >= candidates.length) revert InvalidCandidate(); // Sửa > thành >= và length() -> length

        hasVoted[msg.sender] = true;
        candidates[_candidateIndex].voteCount++; 
    }

    // Sửa return -> returns
    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }
}