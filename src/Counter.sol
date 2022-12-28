// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// A counter application to send and recieve tFIL for calling specific transactions
// Demonstrates the usefulness of Foundry as a toolkit
contract Counter {
    uint256 public fee;

    constructor() {
        fee = 0;
    }

    // Send 1 tFIL to count the variable up
    function countUp() public payable {
        require(msg.value == 1 ether, "1 tFIL needs to be submitted");
        fee++;
    }

    // Recieve 1 tFIL by counting the variable down
    function countDown() public {
        (bool sent, bytes memory _data) = msg.sender.call{value: 1 ether}("");
        require(sent, "Money not sent");
        // address payable caller = payable(msg.sender);
        // caller.transfer(0.5 ether);
        // fee--;
    }
}
