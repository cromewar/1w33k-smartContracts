//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./ERC4671.sol";

contract OneWeek is ERC4671, Ownable {
    // Enum For the Quiz State
    enum QUIZ_STATE {
        OPEN,
        CLOSED,
        REWARDING_PARTICIPANTS
    }

    QUIZ_STATE public quizState;

    // Array of the participants which are withelisted
    address[] public players;
    // Relation between the particpants to the TokenID
    mapping(address => uint256[]) public playerTokens;

    constructor() ERC4671("One Week", "WEEK") {
        quizState = QUIZ_STATE.CLOSED;
    }

    function addToWhiteList(address _participant) public onlyOwner {
        require(quizState == QUIZ_STATE.OPEN, "The Quiz is not opened yet");
        players.push(_participant);
    }

    function openQuiz() public onlyOwner {
        require(quizState == QUIZ_STATE.CLOSED, "The Quiz is already opened");
        quizState = QUIZ_STATE.OPEN;
    }

    function getAddressOfAllowedPlayer(uint256 _index)
        public
        view
        returns (address)
    {
        return players[_index];
    }

    function rewardParticipants() public onlyOwner {
        for (uint256 i = 0; i < players.length; i++) {
            _mint(players[i]);
        }
        quizState = QUIZ_STATE.REWARDING_PARTICIPANTS;
    }

    // function rewardWithBadged(address owner) external {
    //     require(_isCreator(), "You most be the contract creator");
    //     _mint(owner);
    // }
}
