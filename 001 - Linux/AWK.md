# AWK

## Introduction


- Awk is a scripting language used for manipulating data and generating reports. The awk command programming language requires no compiling and allows the user to use variables, numeric functions, string functions, and logical operators.

- Awk is a utility that enables a programmer to write tiny but effective programs in the form of statements that define text patterns that are to be searched for in each line of a document and the action that is to be taken when a match is found within a line.

- Awk is mostly used for pattern scanning and processing. It searches one or more files to see if they contain lines that matches with the specified patterns and then perform the associated actions. 

- Awk is abbreviated from the names of the developers – Aho, Weinberger, and Kernighan.

- AWK gets its name from the initials of its creators: Alfred Aho, Peter Weinberger, and Brian Kernighan.

## WHAT CAN WE DO WITH AWK? 

**1 Text Processing:**

- Extracting specific columns or fields from a text file.
- Reformatting and aligning text data.
- Removing or replacing text based on patterns.

**2 Data Extraction and Reporting:**

- Summarizing and reporting on data.
- Calculating statistics on numerical data.
- Filtering and selecting specific records based on conditions.

**3 Pattern Matching and Searching:**

- Finding and printing lines that match a specific pattern.
- Regular expression matching and manipulation.

**4 Report Generation:**

- Creating formatted reports from structured data.
- Generating customized reports based on specific criteria.

**5 File and Stream Processing:**

- Reading data from files or other input streams.
- Writing processed data to files or other output streams.

**6 Data Transformation:**

- Converting data from one format to another.

- Manipulating and transforming data to meet specific requirements.

**7 Automating Tasks:**

- Creating simple automation scripts for common tasks.

- Batch processing and automation of repetitive operations.

**8 Calculations and Arithmetic Operations:**

- Performing mathematical calculations on numeric data.

- Adding, subtracting, multiplying, and dividing numerical values.


**9 fields and Records:** AWK divides each line into fields and each line into records. By default, fields are separated by spaces or tabs, and records are lines.

**10 Pattern-Action Pairs:** AWK programs consist of pattern-action pairs. If a line matches a pattern, the associated action is executed.


```
/pattern/ { action }
```
**11 Variables:** AWK has built-in variables like $0 (entire line), $1, $2, ... (individual fields), NF (number of fields), and more.

**12 Print Statement:** The print statement is used to display output. It can print variables, strings, and the contents of fields.

```
{ print $1, $2 }
```
**13 User-Defined Variables:** You can define your own variables in AWK using the = operator.

```
myVar = 10
```

**14 Built-in Functions:** AWK provides numerous built-in functions for string manipulation, numeric operations, and more. For example, length(), substr(), sprintf(), etc.

**15 BEGIN and END Blocks:** The BEGIN block is executed before processing any input, and the END block is executed after processing all input.

```
BEGIN { print "Start processing" }
{ actions }
END { print "End processing" }
```
