#!/bin/bash
set -e
lared-node-bootstrap enrolRewardProgram -t target/testnet-supernode  -u http://api-01.ap-northeast-1.testnet.symboldev.network:3000  $1 $2 $3
