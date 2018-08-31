#!/bin/bash

REPO=github.com/secret-castle/ct-get-sth-log
DIR=ct-get-sth-log

git_config() {
  git config user.email "travis@travis-ci.org"
  git config user.name "Travis CI"
}

git_commit() {
  git add --all
  git commit --message "[ci-skip] Travis build: $TRAVIS_BUILD_NUMBER"
}

git_push() {
  git remote add ci https://${GH_TOKEN}@${REPO}.git > /dev/null 2>&1
  git push --quiet ci master
}

pushd ${DIR}
git_config
git_commit
git_push
popd
