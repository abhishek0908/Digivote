pragma solidity 0.5.16;

contract Election {

    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    //store account that have voted
    mapping(address=>bool) public voters;
    //store candidates
    //fetch candidates

    mapping(uint => Candidate) public candidates;

    //storage candidate count
    uint public candidatesCount;

    function addCandidate(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }

    // event votedEvent (
    //   uint indexed _candidateId
    // );

    // Constructor
    constructor() public {
        addCandidate("Narendra Modi ");
        addCandidate("Rahul Gandhi");
    }
    function vote (uint  _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
       // emit votedEvent(_candidateId);
    }
}
