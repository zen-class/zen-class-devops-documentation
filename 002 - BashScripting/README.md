# Bash(Bourne Again Shell) 🐧

### What is Bash sripting
Bash stands for Bourne Again Shell. A Bash Shell Script is a plain text file containing a set of various commands that we usually type in the command line. It is used to automate repetitive tasks on Linux. To automate day to day automation task, system admins write bash script in Linux system.
Bash script has .sh extension but the extension is not mandatory.

### What is Shell
A Shell is basically a command-line interpreter between user and kernel or a complete environment specially designed to run commands, shell scripts, and programs.

### Advantages of Shell Script
- Easy to use
- Time saving
- Automated
- Can be installed on all Linux system
- Portable
- Can run multiple commands

### Disadvantages of Shell Script
- There may be errors in shell scripting that prove to be quite costly.
- The programs in shell script are quite slow while executing and a new process is required for every shell command executed.
- Different platforms in shell scripting may also have compatibility problems.

### First Bash script
Bash script starts with **#!** referred as the shebang followed by **/bin/bash** it actually tells the path of the interpreter to execute the commands in the script.

**echo**: echo is a built-in command in Bash, which is used to display the standard output by passing the arguments. It is the most widely used command for printing the lines of text/String to the screen.

### To Run bash use 
```
 bash script_name.sh
 OR
./script_name.sh
```
### Script to print Hello Wrld!
```
#!/bin/bash
echo "******************"
echo "Hello World!"
echo "******************"
```
### After execution

![image](https://user-images.githubusercontent.com/69889600/218807819-e1b42e78-0ec8-4d7c-8406-2fbc2a5dd229.png)

### Single line comment in bash use [**#**]

![image](https://user-images.githubusercontent.com/69889600/218809940-a93d1325-e79e-4bdc-a6d8-3191ea3d4224.png)

### After execution

![image](https://user-images.githubusercontent.com/69889600/218807819-e1b42e78-0ec8-4d7c-8406-2fbc2a5dd229.png)

### Multiple line comment in bash use [: ' commented text  ']

![image](https://user-images.githubusercontent.com/69889600/218812434-edc051c9-7492-4b3d-94de-4c330a00990c.png)

### After execution

![image](https://user-images.githubusercontent.com/69889600/218812563-d1abbd60-109a-450a-812e-1070737f7437.png)

### Variables
Variables are used to store information.

## To store information use below syntax

```
Variable-name="Variable-value"
```
```
echo $variable-name
```
Set variable user="john"
```
echo $user ---> john
```
Print environment variables
```
echo "This is user ${user} in the team" -----> This is user john in the team
```
### Command subsitution using back ticks
Use back tick to print output of the command as shown below
```
 echo "There are `wc -l > hello.txt` lines in hello.txt file" -----> There are 5 lines in hello.txt file
```
### Command line arguments

- $? ---- Exit status of last run command, 0 means success and non-zero indicates failure.
- $0 ---- File name of our script
- $1..$n ---- Script arguements
- $# ----- number of args that our script was run with

- $? ---- Exit status of last run command, 0 means success and anything else indicates failure.
#### Example:
```
ls -l
$? --> 0 (meaning command was succesful)
lsss -l
$? ---> Non-zero value (meaning commnad was not succesful or wrong command)
```
- $0 ---- File name of our script
- $1..$n ---- Script arguements
#### Example:
```
#!/bin/bash
echo "Script name is $0"
echo "First argument passed is $1"
echo "Second argument passed is $2"
```
#### Run the above script, consider name of script is hello.sh and arguments are Hello and World
./hello.sh Hello World
#### Output
```
Script name is hello.sh
First argument passed is Hello
Second argument passed is World
```
### Quotes in Bash
```
echo "The user is $USER" --> The user is John
echo 'The user is $USER' --> The user is $USED
```
### Export variables in Bash
In every user home directory there is a hidden file called .bashrc. If you place export variable and value this file. It will become permanent export variable. We often use it for setting envirnment variables like JAVA_HOME, MAVEN_HOME.
If you want to add export variable globally for all user then edit **etc/profile** and add export variable.
```
ls -a
vi .bashrc (edit this file and update export variable)
export JAVA_HOME="usr/bin/jvm"
```
### Take User Input using read
-p [will stay to take input]
-sp [ will make password invisible when user enter]
```
#!/bin/bash
echo "Enter your Name:"
read Name
echo "Enter username and password"
read -p 'username: ' username
read -sp 'password: ' psw
```
### If else elif statements
```
If [condition]
then
  something
elif
  something
else
  something
fi  
```
### Operators in Bash
 - ==
 - !=
 - >=
 - <=
 - '>'
 - '<'
 - &&
 - ||
 - !
 
- b operator: Checks whether a file is a block special file or not. 
- c operator: Checks whether a file is a character special file or not. 
- d operator: This operator checks if the given directory exists or not. 
- e operator: This operator checks whether the given file exists or not. 
- r operator: This operator checks whether the given file has read access or not. 
- w operator: This operator check whether the given file has write access or not.
- x operator: This operator check whether the given file has execute access or not. 
- s operator: This operator checks the size of the given file. 

### For Loop
```
for variable in <list>
do
  something
done  
```
### While Loop

```
while [condition]
do 
 something
done 
```

### Bash commands

Find shell in the terminal
```
echo $shell
```


