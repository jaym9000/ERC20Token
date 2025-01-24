// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;
import {Script} from "forge-std/Script.sol";
import {ERCToken} from "../../src/ERCToken.sol";

contract DeployToken is Script {
    function deploy() public {
        new ERCToken(msg.sender);
    }
}
