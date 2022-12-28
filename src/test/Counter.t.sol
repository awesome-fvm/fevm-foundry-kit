// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "./utils/Cheats.sol";
import "../Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    address alice;

    function setUp() public {
        counter = new Counter();
        alice = address(1);
    }

    // Here, 'ether' can be construed as tFIL
    function testCountUp() public {
        vm.deal(alice, 2 ether);
        // Prank the VM to think the next caller is Alice
        // as opposed to the current smart contract
        vm.prank(alice);
        counter.countUp{value: 1 ether}();
        assertEq(counter.fee(), 1, "Invalid State");
        // Logging
        emit log_uint(alice.balance);
        emit log_uint(address(counter).balance);
        assertEq(alice.balance, 1 ether, "Invalid Balance State");
        emit log_uint(address(counter).balance);
        vm.prank(alice);
        counter.countDown();
        emit log_uint(address(counter).balance);
    }

    function testCountDown() public {}
}
