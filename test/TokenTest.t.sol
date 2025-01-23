// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test} from "forge-std/Test.sol";
import {ERCToken} from "../../src/ERCToken.sol";

contract TokenTest is Test {
    ERCToken public token;
    address public owner;
    address public user1;
    address public user2;
    uint256 public constant INITIAL_MINT_AMOUNT = 1000e18; // 1000 tokens
    uint256 public constant TRANSFER_AMOUNT = 100e18; // 100 tokens

    function setUp() public {
        owner = address(this);
        user1 = makeAddr("user1");
        user2 = makeAddr("user2");

        // Deploy token with this contract as owner
        token = new ERCToken(owner);

        // Mint initial tokens to owner
        token.mint(owner, INITIAL_MINT_AMOUNT);
    }

    function test_InitialSetup() public view {
        assertEq(token.name(), "EzID");
        assertEq(token.symbol(), "EID");
        assertEq(token.decimals(), 18);
        assertEq(token.owner(), owner);
    }

    function test_Minting() public {
        uint256 mintAmount = 500e18;
        token.mint(user1, mintAmount);
        assertEq(token.balanceOf(user1), mintAmount);
        assertEq(token.totalSupply(), INITIAL_MINT_AMOUNT + mintAmount);
    }

    function test_RevertWhen_MintingByNonOwner() public {
        vm.prank(user1);
        vm.expectRevert();
        token.mint(user1, 100e18);
    }

    function test_Transfer() public {
        token.transfer(user1, TRANSFER_AMOUNT);
        assertEq(token.balanceOf(user1), TRANSFER_AMOUNT);
        assertEq(token.balanceOf(owner), INITIAL_MINT_AMOUNT - TRANSFER_AMOUNT);
    }

    function test_TransferFrom() public {
        // Approve user1 to spend tokens
        token.approve(user1, TRANSFER_AMOUNT);

        // User1 transfers tokens from owner to user2
        vm.prank(user1);
        token.transferFrom(owner, user2, TRANSFER_AMOUNT);

        assertEq(token.balanceOf(user2), TRANSFER_AMOUNT);
        assertEq(token.balanceOf(owner), INITIAL_MINT_AMOUNT - TRANSFER_AMOUNT);
    }

    function test_Burning() public {
        token.burn(TRANSFER_AMOUNT);
        assertEq(token.balanceOf(owner), INITIAL_MINT_AMOUNT - TRANSFER_AMOUNT);
        assertEq(token.totalSupply(), INITIAL_MINT_AMOUNT - TRANSFER_AMOUNT);
    }

    function test_Allowance() public {
        token.approve(user1, TRANSFER_AMOUNT);
        assertEq(token.allowance(owner, user1), TRANSFER_AMOUNT);
    }

    function test_RevertWhen_TransferInsufficientBalance() public {
        vm.expectRevert();
        token.transfer(user1, INITIAL_MINT_AMOUNT + 1);
    }

    function test_RevertWhen_TransferFromInsufficientAllowance() public {
        token.approve(user1, TRANSFER_AMOUNT);

        vm.prank(user1);
        vm.expectRevert();
        token.transferFrom(owner, user2, TRANSFER_AMOUNT + 1);
    }
}
