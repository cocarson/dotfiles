#!/bin/bash

branch_exists() {
    if [ $1 == 0 ]; then
        exists=true
    else
        exists=false
    fi
}

f() {
    BRANCH_NAME="pr-$1";
    git show-ref --verify --quiet refs/heads/$BRANCH_NAME;
    branch_exists $?;
    if [ "$exists" = "true" ]; then
        echo "Deleting existing branch $BRANCH_NAME... \n"
        git checkout main
        git branch -D $BRANCH_NAME
    fi
    git fetch upstream pull/$1/head:$BRANCH_NAME;
    git checkout $BRANCH_NAME;
    echo "Up to date for PR $1";
};
f $1

