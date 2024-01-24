# AWK 

- A text pattern scanning and processing language, created by Aho, Weinberger & Kernighan (hence 
the name). It can be quite sophisticated so this is NOT a complete guide, but should give you a taste
of what awk can do. It can be very simple to use, and is strongly recommended. There are many 
on-line tutorials of varying complexity, and of course, there is always 'man awk'.

**AWK basics**

- An awk program operates on each line of an input file. It can have an optional BEGIN{} section of 
commands that are done before processing any content of the file, then the main {} section works 
on each line of the file, and finally there is an optional END{} section of actions that happen after 
the file reading has finished:
```
BEGIN { …. initialization awk commands …}
{ …. awk commands for each line of the file…}
END { …. finalization awk commands …}
```
- For each line of the input file, it sees if there are any pattern-matching instructions, in which case it 
only operates on lines that match that pattern, otherwise it operates on all lines. These 
'pattern-matching' commands can contain regular expressions as for grep. The awk commands can 
do some quite sophisticated maths and string manipulations, and awk also supports associative 
arrays.

- AWK sees each line as being made up of a number of fields, each being separated by a 'field 
separator'. By default, this is one or more space characters, so the line:

this is a line of text

- contains 6 fields. Within awk, the first field is referred to as $1, the second as $2, etc. and the whole 
line is called $0. The field separator is set by the awk internal variable FS, so if you set FS=”:” then 
it will divide a line up according to the position of the ':' which is useful for files like /etc/passwd 
etc. Other useful internal variables are NR which is the current record number (ie the line number of
the input file) and NF which is the number of fields in the current line.

- AWK can operate on any file, including std-in, in which case it is often used with the '|' command, 
for example, in combination with grep or other commands. For example, if I list all the files in a 
directory like this:
```
[mijp1@monty RandomNumbers]$ ls -l
total 2648
-rw------- 1 mijp1 mijp1 12817 Oct 22 00:13 normal_rand.agr
-rw------- 1 mijp1 mijp1 6948 Oct 22 00:17 random_numbers.f90
-rw------- 1 mijp1 mijp1 470428 Oct 21 11:56 uniform_rand_231.agr
-rw------- 1 mijp1 mijp1 385482 Oct 21 11:54 uniform_rand_232.agr
-rw------- 1 mijp1 mijp1 289936 Oct 21 11:59 uniform_rand_period_1.agr
-rw------- 1 mijp1 mijp1 255510 Oct 21 12:07 uniform_rand_period_2.agr
-rw------- 1 mijp1 mijp1 376196 Oct 21 12:07 uniform_rand_period_3.agr
-rw------- 1 mijp1 mijp1 494666 Oct 21 12:09 uniform_rand_period_4.agr
-rw------- 1 mijp1 mijp1 376286 Oct 21 12:05 uniform_rand_period.agr
```
- I can see the file size is reported as the 5th column of data. So if I wanted to know the total size of all
the files in this directory I could do:
```
[mijp1@monty RandomNumbers]$ ls -l | awk 'BEGIN {sum=0} {sum=sum+$5} END 
{print sum}'
2668269
```
- **Note** that 'print sum' prints the value of the variable sum, so if sum=2 then 'print sum' gives the 
output '2' whereas 'print $sum' will print '1' as the 2nd field contains the value '1'.

- Hence it would be straightforwards to write an awk command that would calculate the mean and 
standard deviation of a column of numbers – you accumulate 'sum_x' and 'sum_x2' inside the main 
part, and then use the standard formulae to calculate mean and standard deviation in the END part.

- AWK provides support for loops (both 'for' and 'while') and for branching (using 'if'). So if you 
wanted to trim a file and only operate on every 3rd line for instance, you could do this:
```
[mijp1@monty RandomNumbers]$ ls -l | awk '{for (i=1;i<3;i++) {getline}; 
print NR,$0}'
3 -rw------- 1 mijp1 mijp1 6948 Oct 22 00:17 random_numbers.f90
6 -rw------- 1 mijp1 mijp1 289936 Oct 21 11:59 uniform_rand_period_1.agr
9 -rw------- 1 mijp1 mijp1 494666 Oct 21 12:09 uniform_rand_period_4.agr
10 -rw------- 1 mijp1 mijp1 376286 Oct 21 12:05 uniform_rand_period.agr
```
- where the 'for' loop uses a 'getline' command to move through the file, and only prints out every 3rd
line. Note that as the number of lines of the file is 10, which is not divisible by 3, the final command
finishes early and so the final 'print $0' command prints line 10, which you can see as we also print 
out the line number using the NR variable.

# AWK Pattern Matching

- AWK is a line-oriented language. The pattern comes first, and then the action. Action statements are
enclosed in { and }. Either the pattern may be missing, or the action may be missing, but, of course, 
not both. If the pattern is missing, the action is executed for every single record of input. A missing 
action prints the entire record.

- AWK patterns include regular expressions (uses same syntax as 'grep -E') and combinations using 
the special symbols '&&' means 'logical AND', '||' means 'logical OR', '!' means 'logical NOT'. You 
can also do relational patterns, groups of patterns, ranges, etc.

# AWK control statements include:
```
if (condition) statement [ else statement ]
while (condition) statement
do statement while (condition)
for (expr1; expr2; expr3) statement
for (var in array) statement
break
continue
exit [ expression ]
```

# AWK input/output statements include:
```
close(file [, how])  Close file, pipe or co-process.

getline  Set $0 from next input record.

getline <file  Set $0 from next record of file.

getline var  Set var from next input record.

getline var <file  Set var from next record of file.

next  Stop processing the current input record. The next input record is read and processing starts over with the first pattern in the AWK program. If the end of the input data is reached, the END block(s),if any, are executed.

nextfile  Stop processing the current input file. If the end of the input data is reached, the END block(s), if any, are executed.

print  Prints the current record.

print expr-list  Prints expressions.

print  expr-list >file  Prints expressions on file.

printf fmt,  expr-list  Format and print.
```
NB The printf command lets you specify the output format more closely, using a C-like syntax, for 
example, you can specify an integer of given width, or a floating point number or a string, etc.
AWK numeric functions include:
atan2(y, x) Returns the arctangent of y/x in radians.
cos(expr) Returns the cosine of expr, which is in radians.
exp(expr) The exponential function.
int(expr) Truncates to integer.
log(expr) The natural logarithm function.
Rand() Returns a random number N, between 0 and 1, such that 0 <= N < 1.
sin(expr) Returns the sine of expr, which is in radians.
sqrt(expr) The square root function.
srand([expr]) Uses expr as a new seed for the random number generator. If no expr is 
provided, the time of day is used.
AWK string functions include:
gsub(r, s [, t]) For each substring matching the regular expression r in the string t, 
substitute the string s, and return the number of substitutions. If t is not 
supplied, use $0.
index(s, t) Returns the index of the string t in the string s, or 0 if t is not present. 
length([s]) Returns the length of the string s, or the length of $0 if s is not 
supplied. 
match(s, r [, a]) Returns the position in s where the regular expression r occurs, or 0 if r 
is not present.
split(s, a [, r]) Splits the string s into the array a using the regular expression r, and 
returns the number of fields. If r is omitted, FS is used instead.
sprintf(fmt, 
expr-list)
Prints expr-list according to fmt, and returns the resulting string.
strtonum(str) Examines str, and returns its numeric value.
sub(r, s [, t]) Just like gsub(), but only the first matching substring is replaced.
substr(s, i [, n]) Returns the at most n-character substring of s starting at i. If n is 
omitted, the rest of s is used.
tolower(str) Returns a copy of the string str, with all the upper-case characters in str 
translated to their corresponding lower-case counterparts. 
Non-alphabetic characters are left unchanged.
toupper(str) Returns a copy of the string str, with all the lower-case characters in str 
translated to their corresponding upper-case counterparts. 
Non-alphabetic characters are left unchanged.
AWK command-line and usage
You can pass variables into an awk program using the '-v' flag as many times as necessary, e.g.
awk -v skip=3 '{for (i=1;i<skip;i++) {getline}; print $0}' a_file
You can also write an awk program using an editor, and then save it as a special scripting file, e.g.
[mijp1@monty Comp_Lab]$ cat awk_strip
#!/usr/bin/awk -f
#only print out every 3rd line of input file
BEGIN {skip=3}
{for (i=1;i<skip;i++)
 {getline};
print $0}
which can then be used as a new additional command 
[mijp1@monty Comp_Lab]$ chmod u+x awk_strip
[mijp1@monty Comp_Lab]$ ./awk_strip my_file.dat
