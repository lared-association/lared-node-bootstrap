#!/bin/bash
set -e

# docker rm -f $(docker ps -aq)
lared-node-bootstrap start -p bootstrap -u current -t target/bootstrap --password 1234 $1 $2 $3
