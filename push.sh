#!/bin/bash

REPO=github.com/secret-castle/ct-get-sth-log
DIR=ct-get-sth-log

pushd ${DIR}
git config user.email "travis@travis-ci.org"
git config user.name "Travis CI"
git remote add ci https://${GH_TOKEN}@${REPO}.git > /dev/null 2>&1
git fetch ci master
git add --all
git commit --message "[ci-skip] Travis build: $TRAVIS_BUILD_NUMBER"
git push ci master
popd
