// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {Qeravon} from "../src/Qeravon.sol";

contract DeployQeravon is Script {
    function run() external returns (Qeravon token) {
        vm.startBroadcast();
        token = new Qeravon();
        vm.stopBroadcast();
    }
}
