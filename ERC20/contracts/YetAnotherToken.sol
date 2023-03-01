pragma solidity ^0.8.0;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract YetAnotherToken is ERC20, AccessControl {
    uint256 constant initialSupply = 1000000 * (10**18);

    struct SomeStruct {
        string someString;
        uint someUint;
        bool someBool;
    }

    mapping(string => SomeStruct) public someMapping;

    event AddStruct(
        string userKey,
        SomeStruct userStruct
    );
    function addStruct (
        string calldata userKey,
        string calldata someString,
        uint someUint,
        bool someBool
        ) public {
        someMapping[userKey] = SomeStruct(someString, someUint,someBool);
        emit AddStruct(userKey, someMapping[userKey]);
    }

    event DeleteStruct(
        string userKey
    );
    function deleteStruct (string calldata userKey) public {
        delete someMapping[userKey];
        emit DeleteStruct(userKey);
    }

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    function mint(address to, uint256 amount) public {
        // Check that the calling account has the minter role
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
        _mint(to, amount);
    }

    constructor() ERC20("YetAnotherToken", "YAT") {
        _setupRole(MINTER_ROLE, msg.sender);
        _mint(msg.sender, initialSupply);
    } 
}