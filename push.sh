#!/usr/bin/bash
cd "${HOME}/${GIT_HOME}"
echo "$GIT_HOME"

git config --global user.email "ks900331@naver.com"
git config --global user.name "dhkim900331"

git add .
git commit -m "a"
git push origin master
