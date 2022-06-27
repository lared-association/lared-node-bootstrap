#!/bin/bash
set -e
lared-node-bootstrap enrollRewardProgram -t target/testnet-supernode  --useKnownRestGateways --password 1111 $1 $2 $3
