#!/bin/bash

set -e

# Use the maven release plugin to update the pom versions and tag the release commit
mvn -B release:prepare release:clean

# Fast-forward release branch to the tagged release commit
git checkout release
git merge --ff-only `git describe --abbrev=0 master`
git checkout master

echo "Created release tag" `git describe --abbrev=0 master`
echo "Remember to: git push origin master && git push origin release && git push origin --tags"
