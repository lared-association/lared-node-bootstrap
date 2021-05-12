#!/bin/bash
set -e

# docker rm -f $(docker ps -aq)
lared-node-bootstrap start -p bootstrap -u current -t target/bootstrap  -c test/custom_bootstrap.yml --password 1234 $1
