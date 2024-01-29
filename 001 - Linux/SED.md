# sed = stream editor

- sed performs basic text transformations on an input stream (a file or input from a pipeline) in a
single pass through the stream, so it is very efficient.

- However, it is sed's ability to filter text in apipeline which particularly distinguishes it from other types of editor.

# SED basics

- sed can be used at the command-line, or within a shell script, to edit a file non-interactively. Perhaps
the most useful feature is to do a 'search-and-replace' for one string to another.

- You can embed your sed commands into the command-line that invokes sed using the '-e' option, or
put them in a separate file e.g. 'sed.in' and invoke sed using the '-f sed.in' option. This latter option is
most used if the sed commands are complex and involve lots of regexps! For instance:

sed -e 's/input/output/' my_file
will echo every line from my_file to standard output, changing the first occurrence of 'input' on each
line into 'output'. NB sed is line-oriented, so if you wish to change every occurrence on each line,
then you need to make it a 'greedy' search & replace like so:
sed -e 's/input/output/g' my_file
The expression within the /.../ can be a literal string or a regexp.
NB By default the output is written to stdout. You may redirect this to a new file, or if you want to
edit the existing file in place you should use the '-i' flag:
sed -e 's/input/output/' my_file > new_file
sed -i -e 's/input/output/' my_file
SED and regexps
What if one of the characters you wish to use in the search command is a special symbol, like '/'
(e.g. in a filename) or '*' etc? Then you must escape the symbol just as for grep (and awk). Say you
want to edit a shell scripts to refer to /usr/local/bin and not /bin any more, then you could do this
sed -e 's/\/bin/\/usr\/local\/bin/' my_script > new_script
What if you want to use a wildcard as part of your search – how do you write the output string? You
need to use the special symbol '&' which corresponds to the pattern found. So say you want to take
every line that starts with a number in your file and surround that number by parentheses:
sed -e 's/[0-9]*/(&)/' my_file
where [0-9] is a regexp range for all single digit numbers, and the '*' is a repeat count, means any
number of digits.
You can also use positional instructions in your regexps, and even save part of the match in a
pattern buffer to re-use elsewhere.
Other SED commands
The general form is
sed -e '/pattern/ command' my_file
where 'pattern' is a regexp and 'command' can be one of 's' = search & replace, or 'p' = print, or 'd' =
delete, or 'i'=insert, or 'a'=append, etc. Note that the default action is to print all lines that do not
match anyway, so if you want to suppress this you need to invoke sed with the '-n' flag and then you
can use the 'p' command to control what is printed. So if you want to do a listing of all the
sub-directories you could use
ls -l | sed -n -e '/^d/ p'
as the long-listing starts each line with the 'd' symbol if it is a directory, so this will only print out
those lines that start with a 'd' symbol.
Similarly, if you wanted to delete all lines that start with the comment symbol '#' you could use
sed -e '/^#/ d' my_file
i.e. you can achieve the same effect in different ways!
You can also use the range form
sed -e '1,100 command' my_file
to execute 'command' on lines 1,100. You can also use the special line number '$' to mean 'end of
file'. So if you wanted to delete all but the first 10 lines of a file, you could use
sed -e '11,$ d' my_file
You can also use a pattern-range form, where the first regexp defines the start of the range, and the
second the stop. So for instance, if you wanted to print all the lines from 'boot' to 'machine' in the
a_file example you could do this:
sed -n -e '/boot$/,/mach/p' a_file
which will then only print out (-n) those lines that are in the given range given by the regexps.
