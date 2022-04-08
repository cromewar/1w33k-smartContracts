from brownie import OneWeek
from scripts.helpful_scripts import get_account


def deploy():
    account = get_account()
    week = OneWeek.deploy({"from": account})
    print("Contract deployed")


def main():
    deploy()
