from os import access
from brownie import OneWeek
from scripts.helpful_scripts import get_account


def test_can_deploy_and_interact():
    account = get_account()
    week = OneWeek.deploy({"from": account})
    week.openQuiz({"from": account})
    tx = week.addToWhiteList(get_account(index=2), {"from": account})
    tx.wait(1)
    address_of_player = week.getAddressOfAllowedPlayer(0)
    assert address_of_player == get_account(index=2).address


def test_can_mint_the_winners():
    account = get_account()
    week = OneWeek.deploy({"from": account})
    week.openQuiz({"from": account})
    tx = week.addToWhiteList(get_account(index=2), {"from": account})
    tx.wait(1)
    tx2 = week.addToWhiteList(get_account(index=3), {"from": account})
    tx2.wait(1)
    tx3 = week.addToWhiteList(get_account(index=4), {"from": account})
    tx3.wait(1)

    week.rewardParticipants({"from": account})
