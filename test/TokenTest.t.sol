// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test} from "forge-std/Test.sol";
import {ERCToken} from "../../src/ERCToken.sol";

contract TokenTest is Test {
    ERCToken public token;

    function setUp() public {
        token = new ERCToken(msg.sender);
    }
}
