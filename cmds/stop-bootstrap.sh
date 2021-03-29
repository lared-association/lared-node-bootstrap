#!/bin/bash
set -e

# docker rm -f $(docker ps -aq)
lared-node-bootstrap stop -t target/bootstrap
