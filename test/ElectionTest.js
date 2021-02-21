var Election = artifacts.require("./Election.sol");

contract("Election", function(account){
    it("initialises with two candidates", function() {
        return Election.deployed().then(function(instance){
            return instance.candidatesCount();
        }).then(function(count){
            assert.equal(count, 2);
        });
    });

    it("initialises the candidates with the correct values", function() {
        return Election.deployed().then(function(instance){
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function(candidate){
            assert.equal(candidate.id, 1, "candidate id is correct");
            assert.equal(candidate.name, "Hello", "candidate name is correct");
            assert.equal(candidate.voteCount, 0, "candidate vote count is correct");
            return electionInstance.candidates(2);
        }).then(function(candidate){
            assert.equal(candidate.id, 2, "candidate id is correct");
            assert.equal(candidate.name, "World", "candidate name is correct");
            assert.equal(candidate.voteCount, 0, "candidate vote count is correct");
        });
    });
});