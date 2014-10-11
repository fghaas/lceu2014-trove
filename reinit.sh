#!/bin/bash

DEVSTACK_SCRIPTS="$HOME/devstack"
REDSTACK_SCRIPTS="$HOME/trove-integration/scripts"

CWD=$PWD

cd $DEVSTACK_SCRIPTS
./unstack.sh
./stack.sh

cd $REDSTACK_SCRIPTS
./redstack start-deps
./redstack start
./redstack kick-start mysql

cd $CWD
