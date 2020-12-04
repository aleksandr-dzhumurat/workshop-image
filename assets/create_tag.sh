#!/bin/bash

N=$(git tag -l --sort=v:refname "$(date +%y.%m).*" | tail -n 1 | cut -d. -f3) && \
NEW_TAG="$(date +%y.%m).$(expr $N + 1)" && \
git tag $NEW_TAG  && \
git push --tags