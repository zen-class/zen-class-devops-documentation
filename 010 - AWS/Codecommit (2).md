# AWS CodeCommit


<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc1.png">



+ AWS CodeCommit is a version control service hosted by Amazon Web Services that you can use to privately store and manage assets (such as documents, source code, and binary files) in the cloud.

+ CodeCommit is a secure, highly scalable, managed source control service that hosts private Git repositories.

+ CodeCommit eliminates the need for you to manage your own source control system or worry about scaling its infrastructure.

+ It supports the standard functionality of Git, so it works seamlessly with your existing Git-based tools.


## Benefits

1. Store code securely

2. Work collaboratively on code

3. Easily scale your version control projects

4. Store anything, anytime

5. Integrate with other AWS and third-party services

6. Easily migrate files from other remote repositories

7. Use the Git tools


## What is Git

+ Git is a DevOps tool used for source code management. 

+ It is a free and open-source version control system used to handle small to very large projects efficiently. 

+ Git is used to tracking changes in the source code, enabling multiple developers to work together on non-linear development.



<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc2.png">



## How does CodeCommit work?

+ CodeCommit is familiar to users of Git-based repositories, but even those unfamiliar should find the transition to CodeCommit relatively simple. 

+ CodeCommit provides a console for the easy creation of repositories and the listing of existing repositories and branches.



<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/arc-workflow.png">




## Repository

+ A repository is the fundamental version control object in CodeCommit.

+ It's where you securely store code and files for your project. It also stores your project history, from the first commit through the latest changes. You can share your repository with other users so you can work together on a project.

+ If you add AWS tags to repositories, you can set up notifications so that repository users receive email about events (for example, another user commenting on code). You can also change the default settings for your repository, browse its contents, and more.

+ You can create triggers for your repository so that code pushes or other events trigger actions, such as emails or code functions. You can even configure a repository on your local computer (a local repo) to push your changes to more than one repository.


## Files

+ In CodeCommit, a file is a version-controlled, self-contained piece of information available to you and other users of the repository and branch where the file is stored.
  
+ You can organize your repository files with a directory structure, just as you would on a computer. Unlike your computer, CodeCommit automatically tracks every change to a file.

+ You can compare versions of a file and store different versions of a file in different repository branches.

+ To add or edit a file in a repository, you can use a Git client. You can also use the CodeCommit console, the AWS CLI, or the CodeCommit API.


## Pull Request

+ A pull request is the primary way you and other repository users can review, comment on, and merge code changes from one branch to another.

+ You can use pull requests to collaboratively review code changes for minor changes or fixes, major feature additions, or new versions of your released software.


## Approval Rule

+ You can create approval rules for pull requests. To automatically apply approval rules to some or all of the pull requests created in repositories, use approval rule templates.

+ Approval rule templates help you customize your development workflows across repositories so that different branches have appropriate levels of approvals and control.

+ You can define different rules for production and development branches. Those rules are applied every time a pull request that matches the rule conditions is created.

+ You can associate an approval rule template with one or more repositories in the AWS Region where they are created.


## Commits

+ Commits are snapshots of the contents and changes to the contents of your repository.

+ Every time a user commits and pushes a change, that information is saved and stored.

+ So, too, is information that includes who committed the change, the date and time of the commit, and the changes made as part of the commit.

+ You can also add tags to commits, to easily identify specific commits

In CodeCommit, you can:

  + Review commits.

  + View the history of commits in a graph.

  + Compare a commit to its parent or to another specifier.

  + Add comments to your commits and reply to comments made by others.


## Branches

+ In Git, branches are pointers or references to a commit. In development, they're a convenient way to organize your work. You can use branches to separate work on a new or different version of files without affecting work in other branches. 

+ You can use branches to develop new features, store a specific version of your project from a particular commit, and more.

+ When you create your first commit, a default branch is created for you. This default branch is the one used as the base or default branch in local repositories (repos) when users clone the repository.

+ The name of that default branch varies depending on how you create your first commit.

+ If you add the first file to your repository by using the CodeCommit console, the AWS CLI, or one of the SDKs, the name of that default branch is main.

+ In CodeCommit, you can change the default branch for your repository. You can also create and delete branches and view details about a branch.



## How to create Codecommit




### **Step 1: Login into AWS management console**





### **Step 2: In AWS management console search for codecommit service**






<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc3.png">





### **Step 3: Click create repository**






<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc5.png">






### **1. Give repository name and click create** 






<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc6.png">






### **2. Once the repository created we use any one of the methods to store the repo locally.**






<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc7.png">






### **3. You can also create files using CodecommitUI.**







<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc8.png">






### **4. Delete our repository using click delete repo option**






<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc9.png">






## How to Create Credential for Codecommit



### **5. Open IAM service go to users** 






<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc11.png">






### **6. Inside user scrool down to reach security Credentials tab**







<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc12.png">






### **7. Click Generate credentials to create HTTPS Keys in a excel format also upload our SSH keys for ssh authentication**




<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc13.png">





## Security in AWS Codecommit

+ Cloud security at AWS is the highest priority. As an AWS customer, you benefit from a data center and network architecture that are built to meet the requirements of the most security-sensitive organizations.

+ **Security of the cloud** – AWS is responsible for protecting the infrastructure that runs AWS services in the AWS Cloud. AWS also provides you with services that you can use securely.

+ **Security in the cloud** – Your responsibility is determined by the AWS service that you use. You are also responsible for other factors including the sensitivity of your data, your company’s requirements, and applicable laws and regulations. 

+ AWS Identity and Access Management (IAM) is an AWS service that helps an administrator securely control access to AWS resources. IAM administrators control who can be authenticated (signed in) and authorized (have permissions) to use CodeCommit resources.

## Pricing



<img src="https://github.com/Vennilavan12/zen-class-devops-documentation/blob/main/010%20-%20AWS/img/cc10.png">




# Git Commands



### Initialize and Create



| Command | Description |
| ------- | ----------- |
| `git init` | Initialize a local Git repository |
| `git clone ssh://git@github.com/[username]/[repository-name].git` | Create a local copy of a remote repository |



### Basic workflow 



| Command | Description |
| ------- | ----------- |
| `git status` | Check status |
| `git add [file-name.txt]` | Add a file to the staging area |
| `git add -A` | Add all new and changed files to the staging area |
| `git commit -m "[commit message]"` | Commit changes |
| `git rm -r [file-name.txt]` | Remove a file (or folder) |



### Branching & Merging



| Command | Description |
| ------- | ----------- |
| `git branch` | List branches (the asterisk denotes the current branch) |
| `git branch -a` | List all branches (local and remote) |
| `git branch [branch name]` | Create a new branch |
| `git branch -d [branch name]` | Delete a branch |
| `git push origin --delete [branch name]` | Delete a remote branch |
| `git checkout -b [branch name]` | Create a new branch and switch to it |
| `git checkout -b [branch name] origin/[branch name]` | Clone a remote branch and switch to it |
| `git branch -m [old branch name] [new branch name]` | Rename a local branch |
| `git checkout [branch name]` | Switch to a branch |
| `git checkout -` | Switch to the branch last checked out |
| `git checkout -- [file-name.txt]` | Discard changes to a file |
| `git merge [branch name]` | Merge a branch into the active branch |
| `git merge [source branch] [target branch]` | Merge a branch into a target branch |
| `git stash` | Stash changes in a dirty working directory |
| `git stash clear` | Remove all stashed entries |



### Send and Receive



| Command | Description |
| ------- | ----------- |
| `git push origin [branch name]` | Push a branch to your remote repository |
| `git push -u origin [branch name]` | Push changes to remote repository (and remember the branch) |
| `git push` | Push changes to remote repository (remembered branch) |
| `git push origin --delete [branch name]` | Delete a remote branch |
| `git pull` | Update local repository to the newest commit |
| `git pull origin [branch name]` | Pull changes from remote repository |
| `git remote add origin ssh://git@github.com/[username]/[repository-name].git` | Add a remote repository |
| `git remote set-url origin ssh://git@github.com/[username]/[repository-name].git` | Set a repository's origin branch to SSH |



### Inspection & Comparison



| Command | Description |
| ------- | ----------- |
| `git log` | View changes |
| `git log --summary` | View changes (detailed) |
| `git log --oneline` | View changes (briefly) |
| `git diff [source branch] [target branch]` | Preview changes before merging |



## Reference

If you want Know more about Codecommit use this reference link
          +  https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html







































