// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

contract HelperConfig {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address minerApi;
        address marketApi;
    }

    mapping(uint256 => NetworkConfig) public chainIdToNetworkConfig;

    constructor() {
        chainIdToNetworkConfig[31415] = getWallabyConfig(); // For the deployed wallaby testnet network
        chainIdToNetworkConfig[5] = getAnvilWallabyConfig(); // For a locally deployed testnet
        activeNetworkConfig = chainIdToNetworkConfig[block.chainid];
    }

    function getWallabyConfig()
        internal
        pure
        returns (NetworkConfig memory wallabyNetworkConfig)
    {
        wallabyNetworkConfig = NetworkConfig({
            minerApi: 0xCC79157eb46F5624204f47AB42b3906cAA40eaB7, // Put here the deployed version of the minerApi
            marketApi: 0x326C977E6efc84E512bB9C30f76E30c160eD06FB // Put here the deployed version of the marketApi
        });
    }

    function getAnvilWallabyConfig()
        internal
        pure
        returns (NetworkConfig memory anvilNetworkConfig)
    {
        anvilNetworkConfig = NetworkConfig({
            minerApi: address(0),
            marketApi: address(0)
        });
    }
}
