#!/bin/bash
set -e

lared-node-bootstrap start -p bootstrap -a light -r  -t target/light $1
