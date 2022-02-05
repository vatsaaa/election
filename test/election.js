var Election = artifacts.require("./Election.sol");

contract("Election", function(accounts) {
    var electionInstance;

    it("initializes with two candidates", function() {
        return Election.deployed().then(function(instance) {
            return instance.candidateCount();
        }).then(function(count) {
            assert.equal(count, 2);
        });
    });

    it("initializes the candidates with correct values", function(){
        return Election.deployed().then(function(instance) {
            electionInstance = instance;

            return electionInstance.candidates(1);
        }).then(function(candidate) {
            assert.equal(candidate[0], 1, "containes the correct candidate id"); // candidate[0] is candidate-id
            assert.equal(candidate[1], "Candidate 1", "contains the correct candidate name"); // candidate[1] is candidate-name
            assert.equal(candidate[2], 0, "contains the correct votes count"); // candidate[2] is votes-count
            return electionInstance.candidates(2);
        }).then(function(candidate) {
            assert.equal(candidate[0], 2, "contains the correct candidate id"); // candidate[0] is candidate-id
            assert.equal(candidate[1], "Candidate 2", "contains the correct candidate name"); // candidate[1] is candidate-name
            assert.equal(candidate[2], 0, "contains the correct votes count"); // candidate[2] is votes-count
        });
    });
});
