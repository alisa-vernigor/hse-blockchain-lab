// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

/**
 * @title Token - a simple example (non - ERC-20 compliant) token contract.
 */
contract Token {
    address private owner; // slot 0

    string public constant name = "MyToken"; // constant variables do not have a slot.

    uint256 private totalSupply; //storage slot 1.

    mapping(address => uint256) private balances;

    /**
     * @param _totalSupply total supply to ever exist.
     */
    constructor(uint256 _totalSupply) {
        console.log(
            "Deploying the contract!, with a totalSupply of -->",
            _totalSupply
        );
        owner = msg.sender;
        totalSupply = _totalSupply;
        balances[owner] += totalSupply;
    }

    /**
     * @param _amount amount to transfer. Needs to be less than balances of the msg.sender.
     * @param _to address receiver.
     */
    function transfer(uint256 _amount, address _to) external {
        require(balances[msg.sender] >= _amount, "Not enough funds");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    /**
     * @param _address address to view the balance.
     */
    function balanceOf(address _address)
        external
        view
        returns (uint256 result)
    {
        result = balances[_address];
    }

    /**
     * @notice returns the total supply.
     */
    function getTotalSupply() external view returns (uint256 _totalSupply) {
        _totalSupply = totalSupply;
    }
}