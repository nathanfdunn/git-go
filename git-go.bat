@ECHO ON

PAUSE :: First, some house cleaning (say yes if prompted by next command)
rmdir /s git_demo_folder

mkdir git_demo_folder
cd git_demo_folder

mkdir new_git_repo
cd new_git_repo

git status

PAUSE :: That's what happens when there's no repo

git init

git status

PAUSE :: Now this folder is a git repository

echo "Hello" > file.txt

git status

PAUSE :: Git sees the change, but nothing is stored yet (untracked)

git add file.txt

git status

PAUSE :: The file is now in the 'staging' area

git commit -m "Added a file saying Hello"

git status

git log

PAUSE :: Committing saves all the changes in the staging area

echo "Hello2" > file2.txt  &  echo "Hello3" > file3.txt & echo "Hello3" > file4.txt

git status

git add file2.txt

git status

PAUSE :: You can have a mixture of 'staged' and 'untracked' files

git add .

git status

PAUSE :: `git add .` will stage all the changes

git commit -m "Added three more greeting files"

git status

PAUSE :: Now you will learn about branching

git branch

PAUSE :: List of your branches (You're currently on you're master branch)

git branch new-branch

git branch

PAUSE :: You've created your new-branch, but you're still on your master branch

git checkout new-branch

git branch

PAUSE :: Now you're on your new-branch

echo "Bye" > file.txt  &  echo "Bye2" > file2.txt  &  echo "Bye3" > file3.txt

git status

git diff

PAUSE :: List what is different compared to your master branch

git add .

git commit -m "Made files say bye instead"

git checkout master

type file.txt

PAUSE :: Back on the old branch, the content hasn't changed!

git merge new-branch

type file.txt

PAUSE :: Now the changes have been merged into your branch

git branch

git branch -d new-branch

git branch

PAUSE :: You can delete the old branch since it's no longer needed

cd ..

git clone https://github.com/nathanfdunn/git-go.git

PAUSE :: That is how you clone a project on github

cd git-go

git status

git log

PAUSE :: Hopefully this has been helpful

cd ..\..
