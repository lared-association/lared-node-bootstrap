#!/bin/bash
set -e

lared-node-bootstrap config -p bootstrap --report -t target/bootstrap $1
