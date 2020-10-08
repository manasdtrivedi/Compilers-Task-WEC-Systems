# If-Then-Else Parser
## Description
This repository contains a parser, in the form of an executable file `a.out`, which addresses the ambiguity caused by dangling else, and is able to parse if-else constructs in C (which may contain dangling else).

## Grammar

The following grammar has been used to tackle the dangling else problem:
```
stmt → matched | unmatched
matched → if expr then matched else matched | stmt-list | ε
unmatched → if expr then stmt | if expr then matched else unmatched
```
## Usage

Run the following commands in the terminal:
```
$ yacc -d parser.y
$ lex scanner.l
$ gcc lex.yy.c y.tab.c
$ ./a.out
```
Now, enter a valid and or an invalid input in the terminal, and press enter. Example of such inputs are given below.

#### Examples of valid inputs
```
if expr then stmt-list
```
```
if expr then stmt-list else stmt-list
```
```
if expr then if expr then stmt-list else stmt-list
```
```
if expr
```
```
if expr then else
```
#### Examples of invalid inputs
```
if expr
```
```
if then else
```
```
<any input which contains a word which is not 'if', 'then', 'else', 'expr', and 'stmt-list'>
```
