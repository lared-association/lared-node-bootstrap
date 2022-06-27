#!/bin/bash
set -e
lared-node-bootstrap upgradeVotingKeys -t target/testnet-supernode $1 $2 $3
