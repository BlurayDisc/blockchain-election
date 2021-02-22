// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

// Truffle console helper:

// Election.deployed().then(function(i) { app=i;})

// app.candidates(1).then(function(c){candidate = c;})
// candidate.voteCount.toNumber()

// let accounts = await web3.eth.getAccounts();
// app.vote(1, { from: accounts[0] })
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

    // Store accounts that have voted
    mapping(address => bool) public voters;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    constructor() public {
        addCandidate("Joe Bidden");
        addCandidate("Hunter Bidden");
    }

    function addCandidate(string memory name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
    }

    function vote(uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender], 'You have already casted your vote.');

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, 'Candidate id is invalid');

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}
