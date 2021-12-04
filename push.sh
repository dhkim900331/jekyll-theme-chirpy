#!/usr/bin/bash
cd "${HOME}/${GIT_HOME}"
echo "$GIT_HOME"

LOG_TIME=`date +%y%m%d_%H%M`
TITLE=$1

if [ "e${TITLE}" == "e" ]; then
     echo "push 'commit title'"
     exit;
fi

git config --global user.email "ks900331@naver.com"
git config --global user.name "dhkim900331"

git add .
git commit -m "[${LOG_TIME}] ${TITLE}"
git push origin master
#
