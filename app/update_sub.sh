#/bin/bash

git pull;
git checkout stable;
git merge dev;
git push;
git checkout release;
git merge stable;
git push;
git checkout dev;

