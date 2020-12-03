#!/bin/bash

git config --global user.name $GIT_USER_NAME && \
git config --global user.email $GIT_USER_EMAIL && \
N=$(git tag -l --sort=v:refname "release_$(date +%y.%m).*" | tail -n 1 | cut -d. -f3) && \
NEW_TAG="release_$(date +%y.%m).$(expr $N + 1)" && \
git tag $NEW_TAG  && \
git push --tags