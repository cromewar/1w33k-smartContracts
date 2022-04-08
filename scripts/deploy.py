from brownie import OneWeek
from scripts.helpful_scripts import get_account


def deploy():
    account = get_account()
    week = OneWeek.deploy({"from": account})
    tx = week.rewardWithBadged(account.address, {"from": account})
    tx.wait(1)
    print("token minted")


def main():
    deploy()
