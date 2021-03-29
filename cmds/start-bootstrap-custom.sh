#!/bin/bash
set -e
lared-node-bootstrap start -u current -p bootstrap -c test/custom_preset.yml -t target/bootstrap-custom --password 1234 $1
