#!/bin/bash
set -e

lared-node-bootstrap healthCheck -t target/bootstrap $1
