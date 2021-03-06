#!/bin/zsh

upstream=$(echo $1 | sed -n 's#.*github.com[:/]\([^/]*\)/.*#\1#p')
server=$(echo $1 | sed -n 's#\(.*github.com[:/]\).*#\1#p')
name=$(echo $1 | sed -n 's#.*/\(.*\)\.git#\1#p')
dest=${2:-$name}
username=$(git config --get github.user)

git clone $server$upstream/$name.git $dest
cd $dest
git remote rm origin
git remote add origin $server$username/$name.git
git remote add upstream $server$upstream/$name.git
git fetch --all
