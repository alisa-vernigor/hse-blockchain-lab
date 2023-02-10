pragma solidity ^0.8.0;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract YetAnotherToken is ERC20, AccessControl {
    uint256 constant initialSupply = 1000000 * (10**18);

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    function mint(address to, uint256 amount) public {
        // Check that the calling account has the minter role
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
        _mint(to, amount);
    }

    constructor() ERC20("YetAnotherToken", "YAT") {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _mint(msg.sender, initialSupply);
    } 
}