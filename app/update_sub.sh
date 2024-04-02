#/bin/bash

git pull;
git checkout stable;
git pull;
git merge dev;
git push;
git checkout release;
git pull;
git merge stable;
git push;
git checkout dev;

