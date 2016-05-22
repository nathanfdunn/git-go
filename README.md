# git-go
Git-go will help show you the *very* basics of git.

# Prework
[Install git](https://git-scm.com/downloads)

[Configure identity](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup#Your-Identity)

# Usage
The script should be executed from within a directory that is not a git repository. If executed within a git repository, the script will fail gracefully.

## Mac & Linux
```bash
> curl -O https://raw.githubusercontent.com/nathanfdunn/git-go/master/git-go.sh
> bash git-go.sh
```

## Windows
Copy the [contents of the `git-go.bat`](https://raw.githubusercontent.com/nathanfdunn/git-go/master/git-go.bat) file into your directory and run
```
> git-go.bat
```

# Output

```
>bash git-go.sh 


mkdir git_demo_folder
cd git_demo_folder

mkdir new_git_repo
cd new_git_repo

git status
fatal: Not a git repository (or any of the parent directories): .git

pause ## That's what happens when there's no repo
Press any key to continue . . . 

git init
Initialized empty Git repository in /Users/nathandunn/Projects/git_demo_folder/new_git_repo/.git/

git status
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)

pause ## Now this folder is a git repository
Press any key to continue . . . 

echo "Hello" > file.txt

git status
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    file.txt

nothing added to commit but untracked files present (use "git add" to track)

pause ## Git sees the change, but nothing is stored yet (untracked)
Press any key to continue . . . 

git add file.txt

git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

    new file:   file.txt


pause ## The file is now in the 'staging' area
Press any key to continue . . . 

git commit -m "Added a file saying Hello"
[master (root-commit) b760d6e] Added a file saying Hello
 1 file changed, 1 insertion(+)
 create mode 100644 file.txt

git status
On branch master
nothing to commit, working directory clean

git log
commit b760d6e44b009faf600abc65236a024652ab17e8
Author: Nathan Dunn <nathanfdunn@gmail.com>
Date:   Sun May 22 12:48:41 2016 -0400

    Added a file saying Hello

pause ## Committing saves all the changes in the staging area
Press any key to continue . . . 

echo "Hello2" > file2.txt  &  echo "Hello3" > file3.txt & echo "Hello3" > file4.txt

git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

    file2.txt
    file3.txt
    file4.txt

nothing added to commit but untracked files present (use "git add" to track)

git add file2.txt

git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   file2.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    file3.txt
    file4.txt


pause ## You can have a mixture of 'staged' and 'untracked' files
Press any key to continue . . . 

git add .

git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   file2.txt
    new file:   file3.txt
    new file:   file4.txt


pause ## `git add .` will stage all the changes
Press any key to continue . . . 

git commit -m "Added three more greeting files"
[master 940cf06] Added three more greeting files
 3 files changed, 3 insertions(+)
 create mode 100644 file2.txt
 create mode 100644 file3.txt
 create mode 100644 file4.txt

git status
On branch master
nothing to commit, working directory clean

pause ## Now you will learn about branching
Press any key to continue . . . 

git branch
* master

pause ## List of your branches (You're currently on you're master branch)
Press any key to continue . . . 

git branch new-branch

git branch
* master
  new-branch

pause ## You've created your new-branch, but you're still on your master branch
Press any key to continue . . . 

git checkout new-branch
Switched to branch 'new-branch'

git branch
  master
* new-branch

pause ## Now you're on your new-branch
Press any key to continue . . . 

echo "Bye" > file.txt  &  echo "Bye2" > file2.txt  &  echo "Bye3" > file3.txt

git status
On branch new-branch
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   file.txt
    modified:   file2.txt
    modified:   file3.txt

no changes added to commit (use "git add" and/or "git commit -a")

git diff
diff --git a/file.txt b/file.txt
index e965047..0917008 100644
--- a/file.txt
+++ b/file.txt
@@ -1 +1 @@
-Hello
+Bye
diff --git a/file2.txt b/file2.txt
index f5482f7..5c3d2c4 100644
--- a/file2.txt
+++ b/file2.txt
@@ -1 +1 @@
-Hello2
+Bye2
diff --git a/file3.txt b/file3.txt
index 741e5be..4056c17 100644
--- a/file3.txt
+++ b/file3.txt
@@ -1 +1 @@
-Hello3
+Bye3

pause ## List what is different compared to your master branch
Press any key to continue . . . 

git add .

git commit -m "Made files say bye instead"
[new-branch b81ea0c] Made files say bye instead
 3 files changed, 3 insertions(+), 3 deletions(-)

git checkout master
Switched to branch 'master'

cat file.txt
Hello

pause ## Back on the old branch, the content hasn't changed!
Press any key to continue . . . 

git merge new-branch
Updating 940cf06..b81ea0c
Fast-forward
 file.txt  | 2 +-
 file2.txt | 2 +-
 file3.txt | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

cat file.txt
Bye

pause ## Now the changes have been merged into your branch
Press any key to continue . . . 

git branch
* master
  new-branch

git branch -d new-branch
Deleted branch new-branch (was b81ea0c).

git branch
* master

pause ## You can delete the old branch since it's no longer needed
Press any key to continue . . . 

cd ..

git clone https://github.com/nathanfdunn/git-go.git
Cloning into 'git-go'...
remote: Counting objects: 23, done.
remote: Total 23 (delta 0), reused 0 (delta 0), pack-reused 23
Unpacking objects: 100% (23/23), done.
Checking connectivity... done.

pause ## That is how you clone a project from github
Press any key to continue . . . 

cd git-go

git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean

git log
commit 9763e3651848042b096b313083a568ee7ba78f2a
Author: Nathan Dunn <nathanfdunn@gmail.com>
Date:   Tue Mar 15 11:39:06 2016 -0400

    Prevent script execution from within git repository

commit 89b623516d38af7780bea06739a2b1de40bb3269
Author: Nathan Dunn <nathanfdunn@gmail.com>
Date:   Tue Mar 15 10:19:17 2016 -0400

    Added documentation

commit d48231f845ae3d44ff244453536a8f34afb4ce83
Author: Nathan Dunn <nathanfdunn@gmail.com>
Date:   Mon Mar 14 17:14:15 2016 -0400

    Added template

commit bd2612afb46a21f932a83f095d81c9848a41c18a
Author: Nathan Dunn <nathanfdunn@gmail.com>
Date:   Mon Mar 14 08:14:27 2016 -0400

    Added windows version of git-go

commit 447df996872593d5c8a387294e9d7696679a351e
Author: Nathan FD <nathanfdunn@gmail.com>
Date:   Mon Mar 14 08:05:55 2016 -0400

    Initial commit

pause ## Hopefully this has been helpful
Press any key to continue . . . 
```