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


# Git Overview

+ **Version Control System (VCS):** Git is a distributed version control system designed to track changes in source code and facilitate collaboration among multiple developers.

+ **Repository:** A repository, often referred to as a "repo," is a central location where Git stores all the files, history, and metadata of a project.

+ **Commits:** A commit is a snapshot of changes made to the repository. It represents a logical unit of work and includes a unique identifier, a commit message describing the changes, and a reference to the previous commit.

+ **Branches:** Git allows for the creation of multiple branches, which are independent lines of development. Branches enable developers to work on separate features or bug fixes without interfering with the main codebase.

+ **Master/Main Branch:** The main branch, traditionally named "master" or "main," serves as the default branch and typically represents the stable version of the code.

+ **Checkout:** The act of switching to a different branch is called checkout. It allows developers to work on a specific branch and access its code and history.

+ **Merge:** Merging combines the changes from one branch into another. It integrates the commits of a source branch into a target branch, incorporating all the changes seamlessly.

+ **Pull/Pull Request:** When working collaboratively, a developer can request changes from their branch to be merged into another branch through a pull request. This process allows for review and discussion before the merge takes place.

+ **Push:** Pushing refers to sending local commits to a remote repository, updating it with the latest changes. This step makes the changes accessible to other developers working on the same repository.

+ **Remote Repository:** A remote repository is a copy of the repository stored on a server or hosting platform. It allows for collaboration and synchronization among multiple developers.

+ **Clone:** Cloning is the process of creating a local copy of a remote repository. Developers can clone repositories to their local machines to work on the code and contribute to the project.

+ **Fetch:** Fetching retrieves the latest changes from a remote repository without integrating them into the local codebase. It updates the local repository's knowledge of the remote repository's state.

+ **Pull:** Pulling combines the fetch operation with automatically merging the changes into the current branch. It allows developers to update their local codebase with the latest changes from a remote repository.

+ **Conflict Resolution:** Conflicts may arise when merging or pulling changes if two or more developers modify the same part of a file. Git provides tools to help resolve these conflicts manually by choosing which changes to keep.

+ **Staging:** Git uses a staging area (also called the "index") to prepare files for commit. Developers can selectively stage specific changes or files, controlling which modifications will be included in the next commit.

+ **Ignoring Files:** Git allows developers to specify files or patterns to ignore, ensuring that certain files, such as compiled binaries or sensitive information, are not tracked or committed.

+ **Tagging:** Tags provide a way to mark specific points in Git history, such as release versions or important milestones. They allow for quick reference to specific commits, providing a more user-friendly identifier.

+ **Git Workflow Models:** Git supports various workflow models, including centralized, feature branch, and Gitflow. These models define how developers collaborate and manage branches and merges within a project.

+ **Git GUIs and Clients:** While Git can be used through the command line interface (CLI), there are also graphical user interfaces (GUIs) and dedicated clients available that provide a more visual and user-friendly interaction with Git.

+ **Git Hosting Platforms:** Git repositories can be hosted on various platforms like GitHub, GitLab, and Bitbucket.
