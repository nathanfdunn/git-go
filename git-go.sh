#!/usr/bin/env bash
function pause(){ read -n1 -r -p "Press any key to continue . . . " key; }
if [ -d git_demo_folder ]; then rmdir git_demo_folder; fi
set -v


mkdir git_demo_folder
cd git_demo_folder

mkdir new_git_repo
cd new_git_repo

git status

pause  # That's what happens when there's no repo

git init

git status

pause  # Now this folder is a git repository

echo "Hello" > file.txt

git status

pause  # Git sees the change, but nothing is stored yet (untracked)

git add file.txt

git status

pause  # The file is now in the 'staging' area

git commit -m "Added a file saying Hello"

git status

git log

pause  # Committing saves all the changes in the staging area

echo "Hello2" > file2.txt  &  echo "Hello3" > file3.txt & echo "Hello3" > file4.txt

git status

git add file2.txt

git status

pause  # You can have a mixture of 'staged' and 'untracked' files

git add .

git status

pause  # `git add .` will stage all the changes

git commit -m "Added three more greeting files"

git status

pause  # Now you will learn about branching

git branch

pause  # List of your branches (You're currently on you're master branch)

git branch new-branch

git branch

pause  # You've created your new-branch, but you're still on your master branch

git checkout new-branch

git branch

pause  # Now you're on your new-branch

echo "Bye" > file.txt  &  echo "Bye2" > file2.txt  &  echo "Bye3" > file3.txt

git status

git diff

pause  # List what is different compared to your master branch

git add .

git commit -m "Made files say bye instead"

git checkout master

cat file.txt

pause  # Back on the old branch, the content hasn't changed!

git merge new-branch

cat file.txt

pause  # Now the changes have been merged into your branch

git branch

git branch -d new-branch

git branch

pause  # You can delete the old branch since it's no longer needed

cd ..

git clone https://github.com/nathanfdunn/git-go.git

pause  # That is how you clone a project from github

cd git-go

git status

git log

pause  # Hopefully this has been helpful

cd ../..
