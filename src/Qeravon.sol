// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Permit.sol";

/// @title Qeravon
/// @notice Fixed-supply QRVN token created for a permissionless market-discovery experiment.
/// @dev No owner, proxy, upgrade, tax, blacklist, pause, transfer gate, or later minting.
contract Qeravon is ERC20, ERC20Permit {
    uint256 public constant MAX_SUPPLY = 1_000_000 ether;
    address public constant INITIAL_RECIPIENT = 0x1ca30BC967A88Fe925799f7c17803545d3acbE31;

    constructor() ERC20("Qeravon", "QRVN") ERC20Permit("Qeravon") {
        _mint(INITIAL_RECIPIENT, MAX_SUPPLY);
    }
}
