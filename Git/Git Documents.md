# GIT NOTES

Git is the **Control Version System.**

<img src="https://github.com/Gitscooby/Images/blob/main/Git%20image%201.png">

### Files have 3 states:

+ committed (stored in database)

+ modified ( changed, not commited)

+ staged (a modified version of the file, marked for the next commit)

Each commit has its own unique ID, it is a hash of its containers and its metadata. It must have a prefix of at least 4 chars (unique in repo).

### Staging Area

It is the virtual space where the changes "go" when we git add. It allows the preparation for any commit

<img src="https://github.com/Gitscooby/Images/blob/main/Git%20image%202.png">


### Special git files

.gitignore = file in the main folder which contains a list of files that are ignored by git (so they're not affected by git adds and git statuses). It can contain patterns (*.pyc) and paths to files.

### Commands

## Install:

sudo apt-get install git

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%203.png">

### Set up:

git config --global user.name "User Name"

git config --global user.email "email@email.com"

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%204.png">

Create a **New Project:**

mkdir **project**

cd **project**

git init (initialize empty git repo in my folder (based on path) .git folder)

ls -la (check my folder)

**Help for each command**

git help <command>

**git status**

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%205.png">


### Add files

git add . = add all on current branch

Git add <filename> = for a specific file
  
<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%206.png">
     
## Delete a file
  
git rm <filename> = deletes a file, updates git and then commit!
  
git rm --cached <filename>" = delete a previously tracked file

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%207.png">

## Display history

git-log = displays the history, the chronological order of commits (based on their IDs), who did them, what was their description
  
<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%208.png">


## What is a branch?

It is a version of our code. Branches have a name and are pointing to a commit (there's a different history+past commits depending on our branch, but some commits may be common).
  
One branch per feature (the smaller the better) so changes happen to the branch, not the master workflow until the final merge. Afterwards, we merge and delete the branch.

Commands

git branch <name> = creates the branch, it's an exact duplicate of our current/previous branch (they point to the same commit)

git branch = returns my current branch

git checkout -b <name> = creates a new branch and makes this new branch as our current working one = git branch <name> + git checkout <name>

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%209.png">

git checkout <name> = changes current (HEAD), <name> points to HEAD now
  
<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2010.png">

git branch -d <name> = deletes this branch (NOT the commits also)

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2011.png">

git merge <branch> = merges 's history with my current branch + try to merge changes in files from both the branches => 2 parents in new commit. (Afterwards we find the most recent parent of those two parents => commits of the new branch = commits of parent1 + commits of parent2 => updates master, master in new commit 

<img src="https://github.com/Gitscooby/Images/blob/main/Git%20image%2012.png">

### Master Branch
  
+ Our default branch after a git init command.

+ (For most projects) it has a 'current' code

+ Usually we create a new branch as a copy of master


## Stash

git stash It is used for hotfixes in branch (meanwhile there are changes in working copy) without commits and checkouts.
Therefore it keeps changes in the working copy and the staging area and thus cleans them up.
We can checkout another branch without committing or losing changes!

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2013.png">
  
<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2014.png">

### Git stash apply 
  
You can re-apply the changes that you just stashed by using the git stash command.

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2015.png"


<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2016.png">



## Commands
  
git stash pop = reapplies the saved working copy
  
Git allows the user to re-apply the previous commits by using git stash pop command. The popping option removes the changes from stash and applies them to your working file.
  
The git stash pop command is quite similar to git stash apply. The main difference between both of these commands is stash pop command that deletes the stash from the stack after it is applied.

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2017.png">


### GitHub's features

fork = copy a repo to your GitHub account
  
### clone = copy at your PC:

git clone

### git @ github.com/UserName/git-repo.git

cd git-repo

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2018.png">
 
Your PC repo has the site repo as its remote
  
Each repo copy has it's own commits/branches/history (some may be common)
  
Each remote has its own URL & name

## Commands

git remote = shows repo's remotes

<img src="https://github.com/Gitscooby/Images/blob/main/git%20image%2019.png">
  
git remote add <name> <url>
git remote rm <name>

