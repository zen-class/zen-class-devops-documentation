# Linux 🐧

#### What is Linux?
-  Linux is a free, open source operating system that enables the communication between computer hardware and software. The Linux OS was developed by Linus Torvalds in 1991. 

#### Why use Linux?
- Open source
- community Support
- Support wide variety of hardware
- Most servers runs on Linux
- Secure compare to Windows

#### Linux distributions
There are many Linux distributions available in the market. It provides a different flavor of the Linux operating system to the users. Popular distros are :

- Ubuntu.
- Fedora.
- Debian.
- Linux Mintand so on.

## Linux File System
Linux provides a dedicated set of file systems that stores every bit of data required for booting up the Linux systems. The file system holds the collection of data or files stored within the computer's hard disk or storage device.

*Use "man heir" to find more insights on linux files system*

```
ls /etc/ 
```
- This directory contains all the configuration file of your application.
if something goes wrong you should be looking in this directory.

```
ls /bin
```
- This directory contains binaries for use by all users and also contains executable files, Linux commands that are used in single user mode, and common commands that are used by all the users, like cat, cp, cd, ls, etc

```
ls /sbin
```
- This directory contains binaries to configure the operating system and executable files. It only contains system binaries which require root privilege to perform certain tasks and are helpful for system maintenance purpose. e.g. fsck, root, init, ifconfig, etc 

```
ls /lib
```
- This directory contains shared libraries which are often used by the ‘/bin’ and ‘/sbin’ directories. It also contains kernel module. These filenames are identable as ld* or lib*.so.*

```
ls /opt
```
- This directory's main purpose is to store optional application software packages. In many cases this is software from outside the distribution repository. Add-on applications from individual vendors should be installed in ‘/opt’. In some systems ‘/opt’ is empty as they may not have any add-on application.

```
ls /tmp
```
- This directory in Linux based systems contains necessary files that are temporarily required by the system as well as other software and applications running on the machine.

For example, when you are writing a document, all the content inside that document is saved as a temporary file inside the /tmp directory. After you have saved it, it gets stored in your preferred location, and the temporary file gets removed once you exit the document.

```
ls /boot
```
- This directory contains contains the linux boot configuration files. This is one of the MOST important folder. Removing anything from this directory or a file getting corrupted will result in a OS crash after reboot. You system won't be able to boot without files in the /boot directory.

```
ls /dev
```
- This directory contain files that represent devices that are attached to the local system. However, these are not regular files that a user can read and write to; these files are called devices files or special files.
*Device files are abstractions of standard devices that applications interact with via I/O system calls.*

```
ls /media
```
- The /media directory contains subdirectories where removable media devices inserted into the computer are mounted. For example, when you insert a CD into your Linux system, a directory will automatically be created inside the /media directory. You can access the contents of the CD inside this directory.

```
ls /mnt
```
- This directory and its subdirectories are intended for use as the temporary mount points for mounting storage devices, such as CDROMs, floppy disks and USB (universal serial bus) key drives. /mnt is a standard subdirectory of the root directory on Linux

```
ls /proc
```
- This directory is for each processes running on our system. It also contains some configuration files

```
ls /var
```
- This directory contains variable data files. This includes spool directories and files, administrative and logging data, and transient and temporary files.


### There are 7 types of files in Linux

- Normal files
- Directories
- References to files
- Character device files
- Block device files
- Symbolic links
- Local domain sockets/named pipes)

### Find more info about files in the directory using below command
```
ls -l
```
Sort files based on timestamp
```
ls -lt
```
Sort files based on timestamp in decending order
```
ls -ltr
```

## Monitoring in Linux

Configured in /etc/monitrc

#### Install Monit
- apt-get update
- apt-get install monit
- systemctl enable monit
- systemctl start monit

Edit /etc/monit/monitrc

#### systemd

systemd is monitoring init system used to manage services
```
systemctl <command> <unitname>
```
  
  - ### enable
  Make sure this unit always starts at boot.
  - ### disable
  Opposite of enable
  - ### start
  Start this unit now(will not automatically starts at next boot)
  - ### stop
  Stop a running unit(will not prevent starting at boot, if enabled)
  - ### reload
  Reread the program configuration files
  - ### restart
  Kill the process and start again, rereading the configuration files
  - ### status
  Check status of unit, show last few lines of log output
  
  ### Log mangaement commands
  
  - Journalctl
  - journactl -u <unit>
  - journactl --since "2 min ago"

## Linux Commands

### Find current working directory:
```
pwd
```
### Find currently logged-in user:
```
whoami
```
### List things in directory:
```
ls
```
### Change directory:
```
cd /Dir_name
```
### Clear the terminal:
```
clear
```
### List hidden files:
```
ls -a
```
### Create new file in terminal:
```
touch file.txt
```
### Read file content:
```
cat file.txt
```
### Create Directory:
```
mkdir directory_name
```
### Create nested Directory using -p flag:
```
mkdir -p dir3/dir2/dir1/directory_name
```
### Move File:
```
mv file_name directory
mv file.txt Downloads/files
```
### Remove File:
```
rm file_name
```
### Remove Directory:
```
rm directory_name
```
### To find use of specific command:
```
man command   E.g. man rm
```
### Remove directory and their contents recursively:
```
rm -r downloads/
```
### Copy file:
```
cp source destination
```
### Switch to root user:
```
sudo -i
```
### use w/who to find uptime, how many users has logged in:
```
w
who
```
### To find and monitor running processes:
```
top
```
### Network- To find out what ports are open and listening:
```
sudo netstat -tupln
```
### Create new file using VI editor:
```
vi test.file
```
### For inserting data press i and write content:
```
i
```
### To save and quit from vi press esc and then :
```
:wq
```
### Print "Hello World" message in terminal :
```
echo "Hello World"
```
### Print std Output to some file :
```
echo "Hello World" 1> somefile.txt
```
### Print std Output to some file but this override the existing contents :
```
echo "Hello World" > somefile.txt
```
### Redirecting standart output and append data in existing file use ">>" :
```
echo "Hello World" >> somefile.txt
```
### To Redirect standard error use 2> :
```
cat nonExistingFile.txt 2> somefile.txt
```
### Redirect input using <, Here we are mailing error.txt to the user palak:
```
mail -s This is errror file" palak < error.txt
```
### Use for searching patterns in files
```
cat somefile.txt | grep Thanks
```
Cut file using delimiter and find fields
```
cat somefile.txt | cut -d: f1
```
### Sort the file contents in alphabatical orders, ignore the leading whitespace using b case-insesitive f
```
cat somefile.txt | sort -bf
```
### Search somethig in directory
```
grep search_term ./*
```
### Install software
```
sudo apt-get install software-name
```
### Used for searching apt packages on a Ubuntu or Debian based systems
```
sudo apt-cache search software-name
```
Change file mode - Read-4, Write-2, Execute-1, no-permissiom-0
```
chmod 777 testfile.txt -
```
Change file mode automatically- /etc/login.defs - search UMASK
```
edit umask 022 --- owner none permissomiom taken, from group read execute permission taken
```
Show first 10 lines of the file
```
head somefile.txt
```
Show last 10 lines of the file
```
tail somefile.txt
```
### Find user details and user password
```
sudo -i
tail /etc/passwd
tail /etc/shadow
```
### Add user and create set home directory
```
useradd -m -d /home/user1 -s /bin/bash user1
cat /etc/shadow  user1:!:19275:0:99999:7:::
```
User can't login as password is not set (you can see the ! mark ) 

### Find which kernel version a system is currently running
```
uname -a
```
### Find system's current IP address
```
ifconfig
ip addr show
```
### Check for free disk space
```
df -ah
```
### Check for openports on linux machine
```
netstat
netstat -tulpn
```
### Check CPU usage for a process 
```
ps aux | grep nginx
top
htop
```
#### Permissions

- Read (r) - 4
- Write (w) - 2
- Execute (x) - 1

drwxr-xr-x

rwx - Root user permission
r-x - Group permission
r-x - perimission to others

Check the permission of the directory
```
ls -ld
```
Assign all permissiom to root users in this directory
```
chmod 700 /opt/directory
```

The crontab is a list of commands that you want to run on a regular schedule, and also the name of the command used to manage that list.

## Crontab

The crontab is a list of commands that you want to run on a regular schedule, and also the name of the command used to manage that list.

List crontab   
```
crontab -l
```
Edit crontab
```
crontab -e
```

MIN HOUR DOM MOY DOW     COMMAND
15  10   *   *   (3-5)   ech0 "$(date): checkin in." >>  /var/log/chcking

sudo less /var/spool/cron/crontab/user

ls /etc/cron.d/

crontab -e -u user

sudo vi /etc/crotab === system wide crontab


Group details   
```
cat /etc/group
```
set password for user   
```
passwd user1 
```
Lock user 
List crontab   
```
usermod -L user1
crontab -l
```

To persist aliases, add alias in -
```
vi .bashrc 
alias ls -la = l
```
  
List open file
```
lsof
```
  
Find who opens this file at the moment
```
lsof /var/log/nginx/access.log
```
  
Find all the files open up by the process
```
ps aux | grep nginx
```
  
What file user has opened right now
```
lsof -u user_name
```
  
Which process is listening on what port
```
lsof -i :port_name
```
  
Which process is listening to tcp protocol
```
lsof -i tcp
```

## Archiving and Compression in linux

## Archieve file
  
```
tar -zcvf doc.tar.gz Directory/
```

#### Archiving and Compressing with tar

- 'f' will specify the filename for the directory (docs.tar.gz in this case)

- 'v' is verbose, means that we will get one line of output for each file we are compressing

- 'c' is for create, we are creating a new archive

- 'z' is for zipping (we are using the g zip program), used to compress archive as well as archiving it

  
#### Unarchieve file
  
```
tar -zxf doc.tar.gz
```
  
#### Unzips a tar directory HERE (in this location) 

- 'z' shows that it is g zipped

- 'x' means to extract it 

- 'f' defines the archive filename (in this case: docs.tar.gz)

       
### Linux Lifecycle & Processes

- running
- waiting or sleeping
- stopped
- zombie

A process in a computer operating system is an executable program in action. The executable program has machine instructions necessary to carry out a specific task. A corresponding process is born when a program is executed for carrying out a task. A programmer writes a software program using a high-level programming language such as C. This is also called ‘code’ and the programmer compiles it to create an executable program. The compilation process converts the code into a set of machine-level instructions, and it becomes intelligible to the operating system. The compiler for Linux systems is GCC or Gnu C Compiler.

--------------------------------------------------------------------------

The executable program remains a passive entity, until it is instructed to run or execute by the user. Then it creates a new entity called a process, which is visible by the command ‘ps’. The process is associated with three identifiers – the Process ID or PID, the Parent Process ID or PPID and the Group ID or GID.

--------------------------------------------------------------------------

In a Linux system, the first process to start is the ‘init’ and it has a PID of 1. All subsequent processes are init’s children, grandchildren and so on. For active process in a Linux system, the command ‘pstree’ will bring up the entire hierarchy, while ‘top’ will show the dynamic view of processes. The Linux kernel uses a scheduler and it controls the execution sequence of all the processes. Linux processes can have one of four states at any given time: running, waiting or sleeping, stopped and zombie.

--------------------------------------------------------------------------

A process achieves a running state when it is actually executing (running) or waiting for execution in the queue of the scheduler, which means it is ready to run or execute. For this reason, the running state is also known as runnable and is represented by R.

--------------------------------------------------------------------------

A process is in a waiting or sleeping state if it must wait for an event to occur or some resource-specific operation needs to complete before the process can continue to run. Therefore, depending on the circumstances, the waiting state is further subcategorized into an interruptible or S state and an uninterruptible or D state.

--------------------------------------------------------------------------

If the scheduler sends a stop signal to a process, the process goes into a stopped state. This might happen, for example, when the process is being debugged or analyzed and this state is represented by T.

--------------------------------------------------------------------------

When a process has completed its execution, but is waiting to retrieve its exit state, the process is said to be in a zombie state, designated by Z. Once it crosses the zombie state or retrieves its exit status, the process dies or ceases to exist.



### 1.Linux:

+ Linux is an open-source operating system based on the Unix family of operating systems.

+ Linus Torvalds developed the Linux kernel and released it in 1991.

+ Linux is known for its stability, security, and flexibility.

+ It is widely used in servers, embedded systems, and as a desktop operating system.

### 2. Linux Distributions:

+ Linux distributions are variations of the Linux operating system that include the Linux kernel, software packages, and a package management system.

+ Popular Linux distributions include Ubuntu, Debian, Fedora, CentOS, and Arch Linux.

+ Each distribution may have its own package management system (e.g., apt, yum, pacman) and software repositories.

### 3. Terminal and Shell:

+ Linux provides a command-line interface (CLI) where users interact with the system using a terminal emulator.

+ The shell is the program that interprets user commands and executes them.

+ Common Linux shells are Bash (Bourne Again Shell), Zsh, and Fish.

### 4. File System Hierarchy:

+ Linux follows a hierarchical file system structure.

+ The root directory is denoted by a forward slash (/) and contains all other directories and files.

+ Common directories include /bin (user binaries), /etc (configuration files), /home (user home directories), /var (variable files), and /usr (user programs).

### 5. Package Management:

+ Package managers simplify software installation and management.

+ Debian-based distributions use apt-get or apt as package managers, while Red Hat-based distributions use yum or dnf.

+ Package managers handle dependencies, resolve conflicts, and provide easy ways to install, update, and remove software packages.

### 6. User and Permissions:

+ Linux is a multi-user operating system, and each user has a unique username and user ID (UID).

+ Users can be assigned to groups, and each group has a group ID (GID).

+ File permissions define access levels for users, groups, and others, represented by read (r), write (w), and execute (x) permissions.

### 7. Processes and Services:

+ A process is an executing instance of a program.

+ Processes can be managed using commands like ps (process status), top (task manager), and kill (terminate a process).

+ Services are background processes that run continuously, providing specific functionality.

+ Systemd is a common service management tool in many Linux distributions.

### 8. Networking:

+ Linux provides robust networking capabilities.

+ The ifconfig command is used to configure network interfaces, while ip command is used for more advanced networking tasks.

+ Network services like DNS, DHCP, and routing can be configured using corresponding configuration files.

### 9. File Permissions:

+  Linux file permissions consist of read (r), write (w), and execute (x) permissions for the owner, group, and others.

+ Permissions can be modified using the chmod command.

+ The chown command changes file ownership, and chgrp changes the group ownership.

### 10. Shell Scripting:

+ Shell scripting allows automating tasks and writing custom scripts.

+ Bash is a popular scripting language on Linux.

+ Scripts can be created with a text editor, given execute permissions, and executed directly or through the shell.

### 11. File Compression and Archives:

+ Linux supports various compression and archiving formats like gzip, bzip2, tar, and zip.

+ The tar command is commonly used to create and extract tarball archives, often combined with compression tools.

### 12. System Monitoring and Logs:

+ Linux provides various tools to monitor system performance



