// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {Qeravon} from "../src/Qeravon.sol";

contract QeravonTest is Test {
    Qeravon internal token;

    function setUp() public {
        token = new Qeravon();
    }

    function testIdentityAndFixedSupply() public view {
        assertEq(token.name(), "Qeravon");
        assertEq(token.symbol(), "QRVN");
        assertEq(token.decimals(), 18);
        assertEq(token.totalSupply(), 1_000_000 ether);
        assertEq(token.MAX_SUPPLY(), 1_000_000 ether);
        assertEq(token.balanceOf(token.INITIAL_RECIPIENT()), 1_000_000 ether);
    }

    function testNoPrivilegedManagementSelectors() public {
        bytes4[5] memory selectors = [
            bytes4(keccak256("mint(address,uint256)")),
            bytes4(keccak256("pause()")),
            bytes4(keccak256("blacklist(address)")),
            bytes4(keccak256("upgradeToAndCall(address,bytes)")),
            bytes4(keccak256("owner()"))
        ];

        for (uint256 i; i < selectors.length; ++i) {
            (bool ok,) = address(token).call(abi.encodeWithSelector(selectors[i]));
            assertFalse(ok);
        }
    }

    function testTransfer() public {
        address recipient = token.INITIAL_RECIPIENT();
        address receiver = makeAddr("receiver");
        vm.prank(recipient);
        token.transfer(receiver, 1 ether);
        assertEq(token.balanceOf(receiver), 1 ether);
    }
}
