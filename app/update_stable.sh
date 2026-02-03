#/bin/bash

git pull;
git checkout stable;
git pull;
git merge dev;
git push;
git checkout dev;

