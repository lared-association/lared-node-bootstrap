#!/bin/bash
set -e

lared-node-bootstrap start --reset --preset bootstrap --customPreset ./test/freenodes_preset.yml --user current -t target/bootstrap-freenodes
