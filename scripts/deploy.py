from brownie import accounts, Lottery, config
import time

def main():
    account = accounts.add(config['wallets']['from_key'])
    contract_address = Lottery.deploy({'from':account}, publish_source=True)

    time.sleep(1)