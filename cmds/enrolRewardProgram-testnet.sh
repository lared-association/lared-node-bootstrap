#!/bin/bash
set -e
lared-node-bootstrap enrolRewardProgram -t target/testnet-supernode  -u http://20.52.134.220:3000  $1 $2 $3
