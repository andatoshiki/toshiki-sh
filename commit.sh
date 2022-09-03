#!/bin/bash

# add all files to commit
git add -A

# update a commit message with timestamp included

git commit -m "update: `date +'%Y-%m-%d'`"

# git push to master branch for current repository
git push -f origin master
