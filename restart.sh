#!/bin/bash

DEVSTACK_SCRIPTS="$HOME/devstack"
REDSTACK_SCRIPTS="$HOME/trove-integration/scripts"

CWD=$PWD


cd $REDSTACK_SCRIPTS
./redstack start-deps

cd $DEVSTACK_SCRIPTS
./rejoin-stack.sh

cd $REDSTACK_SCRIPTS
./redstack start

cd $CWD
