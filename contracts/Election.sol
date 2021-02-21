// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

// Truffle console helper:
// 1. Election.deployed().then(function(i) { app=i;})
// 2. app.candidates(1).then(function(c){candidate = c;})
// 3. candidate.voteCount.toNumber()
contract Election {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    // map of candidates
    mapping(uint256 => Candidate) public candidates;

    // maps can't determine size;
    uint256 public candidatesCount;

    constructor() public {
        addCandidate("Hello");
        addCandidate("World");
    }

    function addCandidate(string memory name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
    }
}
