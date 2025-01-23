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
    constructor(address initialOwner)
        ERC20("EzID", "EID")
        Ownable(initialOwner)
        ERC20Permit("EzID")
    {}

    /// @notice Allows the owner to mint new tokens
    /// @param to The address that will receive the minted tokens
    /// @param amount The amount of tokens to mint
    /// @dev Only callable by the contract owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /*//////////////////////////////////////////////////////////////
                                GETTERS
    //////////////////////////////////////////////////////////////*/

    /// @notice Gets the total supply of the token
    /// @return The total token supply
    function totalSupply() override public view returns (uint256) {}

    /// @notice Gets the balance of a specific address
    /// @param _owner The address to query the balance of
    /// @return balance The token balance of the specified address
    function balanceOf(address _owner) override public view returns (uint256 balance){}

    /// @notice Transfers tokens to a specified address
    /// @param _to The address to transfer to
    /// @param _value The amount to be transferred
    /// @return success True if the transfer was successful
    function transfer(address _to, uint256 _value) override public returns (bool success){}

    /// @notice Transfer tokens from one address to another
    /// @param _from The address which you want to transfer tokens from
    /// @param _to The address which you want to transfer to
    /// @param _value The amount of tokens to be transferred
    /// @return success True if the transfer was successful
    function transferFrom(address _from, address _to, uint256 _value) override public returns (bool success){}

    /// @notice Approve the passed address to spend the specified amount of tokens
    /// @param _spender The address which will spend the funds
    /// @param _value The amount of tokens to be spent
    /// @return success True if the approval was successful
    function approve(address _spender, uint256 _value) override public returns (bool success){}

    /// @notice Check the amount of tokens that an owner allowed to a spender
    /// @param _owner The address which owns the funds
    /// @param _spender The address which will spend the funds
    /// @return remaining The amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) override public view returns (uint256 remaining){}

    // event Transfer(address indexed _from, address indexed _to, uint256 _value);
    // event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}