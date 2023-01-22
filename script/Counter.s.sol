// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "forge-std/Script.sol";
import "../src/Counter.sol";
import "./NetworkConfig.sol";
import "../src/mocks/MarketAPI.sol";
import "../src/mocks/MinerAPI.sol";

contract DeployCounter is Script, HelperConfig {
    function run() external {
        HelperConfig config = new HelperConfig();
        (address minerApi, address marketApi) = config.activeNetworkConfig();
        if (minerApi == address(0)) {
            minerApi = address(new MinerAPI("tFIL"));
        }
        if (marketApi == address(0)) {
            marketApi = address(new MarketAPI());
        }
        new Counter();
    }
}
