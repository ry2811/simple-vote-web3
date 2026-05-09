pragma solidity ^0.8.13;


import "forge-std/Test.sol";
import "../src/simplevote.sol"; 

contract SimpleVoteTest is Test {
    SimpleVote public simpleVote;

    function setUp() public {
        string[] memory names = new string[](2);
        names[0] = "Alice";
        names[1] = "Bob";
        simpleVote = new SimpleVote(names);
    }

    // Hàm test phải nằm trong contract và bắt đầu bằng chữ "test"
    function testVote() public {
        // 1. Arrange & Act
        simpleVote.vote(0);

        // 2. Assert
       
        assertEq(simpleVote.getCandidates()[0].voteCount, 1);
    }
}
