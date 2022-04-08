//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC4671.sol";

contract OneWeek is ERC4671 {
    constructor() ERC4671("One Week", "WEEK") {}

    function rewardWithBadged(address owner) external {
        require(_isCreator(), "You most be the contract creator");
        _mint(owner);
    }
}
