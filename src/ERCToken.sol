// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MyToken - A standard ERC20 token with burning and permitting capabilities
 * @notice This contract implements a standard ERC20 token with additional features
 * @dev Implementation of the basic standard token. Extends ERC20, ERC20Burnable, Ownable, and ERC20Permit functionalities
 * https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
 * Originally based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */

contract ERCToken is ERC20, ERC20Burnable, Ownable, ERC20Permit {
    /*//////////////////////////////////////////////////////////////
                               FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Contract constructor initializes the token with name, symbol and owner
    /// @param initialOwner The address that will be granted ownership of the contract
    /// @dev Sets up ERC20 with "EzID" name and "EID" symbol, and initializes permit functionality
    constructor(
        address initialOwner
    ) ERC20("EzID", "EID") Ownable(initialOwner) ERC20Permit("EzID") {}

    /// @notice Allows the owner to mint new tokens
    /// @param to The address that will receive the minted tokens
    /// @param amount The amount of tokens to mint
    /// @dev Only callable by the contract owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
