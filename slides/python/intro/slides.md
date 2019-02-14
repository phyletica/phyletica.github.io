<style type="text/css">
p { text-align: left; }
</style>

# Intro to Python


## About these sides

I use "`$`" at the beginning of lines to signify that we are typing at the
command prompt

```bash
$ echo "Hello World!"
```

I use "`>>>`" at the beginning of lines that we are typing in the Python
interpreter

```python
>>> print("Hello World!")
```

Code that begins with neither of these means we are typing in
a script with a text editor

```python
print("Hello World!")
```



Before we do anything else, add these two lines to the bottom of `.nanorc` file
in your home directory

```
set tabsize 4
set tabstospaces
```



# What is Python?


It's a programming language that is
<ul>
	<li class="fragment fade-up">Interpreted</li>
	<li class="fragment fade-up">Largely procedural, but flexible</li>
	<li class="fragment fade-up">Terse and clear</li>
    <ul>
	    <li class="fragment fade-up">"Pseudocode that works"</li>
    </ul>
	<li class="fragment fade-up">Comes with standard libraries for interacting with the OS</li>
	<li class="fragment fade-up">Diverse, stable libraries for work across many domains</li>
</ul>


How is Python different than BASH?
<ul>
	<li class="fragment fade-up">BASH has a more "intimate" relationship with the system</li>
    <ul>
        <li class="fragment fade-up">
            BASH is designed to let you easily move around and interact with
            the file system, and use system tools
        </li>
    </ul>
	<li class="fragment fade-up">Python can do this stuff too, but not as easily</li>
	<li class="fragment fade-up">Python code is generally more "self-contained"</li>
    <ul>
        <li class="fragment fade-up">
            Relies on its own packages, rather than system tools
        </li>
    </ul>
	<li class="fragment fade-up">This gives it more flexibility in representing data</li>
    <ul>
        <li class="fragment fade-up">
           Everything doesn't have to be a string! 
        </li>
    </ul>
</ul>


In BASH, when we type

```bash
$ x=Jamie
```

we *assign* the *value* `Jamie` to the variable `x`

During this *assignment* operation, everything to the right of the "`=`" is
*evaluated* to determine its *value*, which is then *assigned* to the variable
named `x`

This evaluation was trivial, but think of

```bash
$ time=`date | awk '{print $4}'`
```

In BASH, the result is always a string of characters

Hence, why we never thought about the *type* of values (and why spaces are so important!)


In Python, when we type

```python
>>> area = 1.5 * 2
```

<ol>
	<li class="fragment fade-up">An *object* is created with value 1.5</li>
	<li class="fragment fade-up">An *object* is created with value 2</li>
	<li class="fragment fade-up">The product operation is evaluated, returning a new object with value 3.0</li>
	<li class="fragment fade-up">The object with value 3.0 is assigned ("bound to") the name "area"</li>
</ol>
<p class="fragment fade-up">
    The *type* of all of these objects is determined dynamically by the Python
    interpreter
</p>


<ul>
	<li class="fragment fade-up">
        Python has many types
    </li>
    <ul>
        <li class="fragment fade-up">
            You can create your own!
        </li>
    </ul>
	<li class="fragment fade-up">
        Common types include integers, floats, strings, and Booleans
    </li>
	<li class="fragment fade-up">
        Getting familiar with *types* and how *objects* are bound to
        *names* will take some getting used to
    </li>
</ul>



# Let's play!


```bash
$ python3
```
<ul>
	<li class="fragment fade-up">
        You are now "inside" the Python interpreter
    </li>
	<li class="fragment fade-up">
        You normally interact with the interpreter via scripts,
        but it can be useful to play around in here
    </li>
</ul>



# Let me out!


```python
>>> quit()
```



# Integers & Floats


```python
>>> 2+3
>>> 2 + 3
>>> 2 + 3.0
>>> 3.0 * 10 + 7
>>> 3.0 * (10 + 7)
```



# Strings 


```python
>>> "Hello, world!"
>>> "Hello, 'world'!"
>>> 'Hello, "world"!'
>>> """Hello
... cruel
... "world"
... """
>>> '''Hello
... cruel
... 'world'
... '''
```



# Types


```python
>>> type(2)
>>> type(2.0)
>>> type("hello")
>>> type(True)
```



# Operations


```python
>>> "hi" * 4
>>> "hi" + 3
>>> "2" + "3"
>>> "2" + 3
>>> "2" + str(3)
>>> int("2") + 3
>>> float("2") + 3
```


```python
>>> 2 / 3
>>> 10 // 3  # floor division
>>> 10 % 3   # modulo
>>> 2 ** 3  # base ** exponent
```



# Using Functions


A useful example is `print`
```python
>>> print("any", "number of", "arguments", 1, 2, 3.0)
>>> print("any", "number of", "arguments", 1, 2, 3.0, sep="--")
>>> print("any", "number of", "arguments", 1, 2, 3.0, sep = "--", end = "\n\n\n")
```



# Using Methods


<ul>
	<li>
        In Python, most functions "belong to" a particular type, or *class* 
    </li>
	<li class="fragment fade-up">
        These are colled *methods*
    </li>
	<li class="fragment fade-up">
        Methods are usually called "from" an *instance* of a *class* (an
        existing object of a particular type)
    </li>
</ul>


Examples of string methods
```python
>>> "blah".upper()
>>> a = "blah"
>>> a.upper()
>>> a.count("h")
```


More examples using a list
```python
>>> a_list = [4, 9, 1]
>>> a_list
>>> type(a_list)
```
```python
>>> a_list.sort()
>>> a_list
>>> a_list.reverse()
>>> a_list
```
<p class="fragment fade-up">
This is an example of object-oriented programming
</p>
<p class="fragment fade-up">
Can you think of some advantages of this?
</p>



# Variables


```python
>>> radius = 2
>>> radius = 1.5 * 4
>>> circum = 2 * radius * 3.14
>>> print(radius)
>>> print(circum)
>>> radius = 4
>>> print(radius)
>>> print(circum)
```
<p class="fragment fade-up">
Why didn't `circum` change?
</p>


```python
>>> print(radius)
>>> another_variable = radius
>>> print(radius)
>>> print(another_variable)
>>> radius = 13
>>> print(radius)
>>> print(another_variable)
```
<p class="fragment fade-up">
Why didn't `another_variable` change?
</p>


```python
>>> print(locals())
>>> "some string"
>>> print(locals())
>>> a = "some string"
>>> print(locals())
>>> 3.0 * 10 + 7
>>> print(locals())
>>> a = 3.0 * 10 + 7
>>> print(locals())
```
<p class="fragment fade-up">
We wouldn't normally use `locals()` when scripting,
but it lets us see what Python has in memory that we
can access with a variable name
</p>



# Collections


## Sequences


### Strings
<ul>
	<li class="fragment fade-up">
        You are already familiar with one sequence class, `str`
    </li>
	<li class="fragment fade-up">
        Strings have lots of methods, how can we see what's possible?
    </li>
	<li class="fragment fade-up">
        The functions `dir` and `help` are very useful
    </li>
</ul>


```python
>>> a = "blah"
>>> dir(a)
>>> help(type(a))
>>> help(a.count)
```
**NOTE:** `help` pipes its output to the system tool `less`. Use arrows (or 'j'/'k')
to navigate, and 'q' to exit.


Strings are what is known as an *immutable* data type
```python
>>> a = "  blah  "
>>> print(a)
>>> a.strip()
>>> print(a)
>>> a[3]
>>> a[3] = "x"
Traceback (most recent call last):
  File "<input>", line 1, in <module>
    a[3] = "x"
TypeError: 'str' object does not support item assignment
```


### Lists
Lists are a very useful *mutable* data type
```python
>>> a_list = [4, 9, 1]
>>> a_list
>>> type(a_list)
>>> a_list.sort()
>>> a_list
>>> a_list.reverse()
>>> a_list
>>> a_list.append(18)
>>> a_list
>>> a_list[0] = "first item"
>>> a_list
>>> help(a_list)
```
<p class="fragment fade-up">
Can contain any type of element, even other lists!
</p>


### Tuples
Tuples are similar to lists, but are *immutable*
```python
>>> a_tuple = (4, 9.0, "another item")
>>> a_tuple[0] = 1
Traceback (most recent call last):
  File "<input>", line 1, in <module>
    a_tuple[0] = 1
TypeError: 'tuple' object does not support item assignment
```

```python
>>> help(a_tuple)
```


### Switching among sequence
Getting an object of a different sequence type is fairly easy
```python
>>> name = "Luna"
>>> type(name)
>>> name_list = list(name)
>>> type(name_list)
>>> type(name)
>>> name_list
>>> name_tuple = tuple(name)
>>> type(name_tuple)
>>> name_tuple
```


But, going from a list or tuple to a string is not as straightforward
```python
>>> name = "Luna"
>>> name_list = list(name)
>>> name_list
>>> name_str = str(name_list)
>>> name_str
<p class="fragment fade-up">
```
Not what you expected?
</p>
<p class="fragment fade-up">
Why does Python do this?
</p>
<p class="fragment fade-up">
Remember, *any* data type can be stored in lists and tuples!
</p>


The `join` method the string class will get us what we want
```python
>>> name = "Luna"
>>> name_list = list(name)
>>> name_list
>>> name_str = "".join(name_list)
>>> name_str
>>> "---".join(name_list)
```


### Sequence operations


#### Indexing & slicing
All sequence types allow *indexing* (also called *dereferencing* or *subscription*) and *slicing*

**Indexing**
```python
>>> name = "Luna"
>>> name_list = list(name)
>>> name[1]
>>> name_list[1]
```
This returns a reference to the second element in the string and list


When the index is negative, it is counted from the end of the sequence
```python
>>> name[-1]
>>> name_list[-1]
```


**Slicing**
```python
>>> letters = "abcdefghij"
>>> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>>> letters[1:4]
>>> numbers[1:4]
>>> numbers[-3:-1]
```
'seqobject[a:b]' returns a new sequence object that contains the items from the
original sequence, starting at index 'a' up to (but not including) index 'b'


#### Boolean operators
```python
>>> restriction_site = "TATA"
>>> seq = "GCTTAATGCTATAGCAT"
>>> restriction_site in seq
>>> restriction_site not in seq
```

```python
>>> numbers = list(range(10))
>>> 0 in numbers
>>> 10 not in numbers
```


## Other Collection Types


### Dictionaries
Dictionaries (`dict`) map keys to objects
```python
>>> dog = {"name": "Luna", "weight": 91.8, "age": 7, "color": "black"}
```
The syntax is '{ key1 : value1, key2 : value2 }'
```python
>>> dog
>>> dog["name"]
>>> "weight" in dog
>>> "breed" in dog
>>> dog["breed"] = "great dane"
>>> "breed" in dog
>>> dog
>>> help(dog)
```


### Sets
-   A set is like a dictionary without values
-   Useful for keeping track unique values (for example)
-   We'll skip them for now



# Scripts


An important difference from BASH is the best practice for the shebang line
```python
#! /usr/bin/env python3
```



# Flow control


## Conditionals


### `if` statements
```python
>>> restriction_site = "TATA"
>>> seq = "GCTTAATGCTATAGCAT"
>>> if restriction_site in seq: 
...     print("cut!")
... else:
...     print("no cut")
...
```
**NOTE:** Indentation is very important! It's how Python knows when a block of
code ends

Everything after ":" needs to be indented by exactly 4 more spaces to be in
included in the statement


```python
>>> x = 0
>>> y = 1
>>> if x == 0:
...     if not y == 0:
...         print("macaroni")
... elif x > 0:
...     print("x is positive")
... else:
...     print("x is negative")
...
```


### `assert` statements
```python
>>> assert 1 == 1, "Hold on, something is awry!"
>>> assert 1 == 2, "Hold on, something is awry!"
```
Use `assert` and use it often

Whenever you find yourself assuming anything about the current state of the
program, it's probably a good time for an `assert`


## Loops


### `while` loop
General syntax is:
```python
while expression:
    statements
```
While the expression evaluates to `True`, the statements will be run again and again

Until the expression is `False` OR another statement interrupts the loop (like
`break` or `return`)


```python
>>> x = ""
>>> while x != 'N':
...     response = input("Would you like to see this prompt again? ")
...     x = response.upper()
...
````


```python
>>> x = ""
>>> while True:
...     response = input("Would you like to see this prompt again? ")
...     x = response.upper()
...     if x == "N" or x == "NO":
...         break
...
```


### `for` loop
General syntax is:
```python
for item in collection:
    do something
```


Works for sequences and other iterables
```python
>>> x = list(range(5))
>>> print(x)
>>> for element in x:
...     print(element)
... 
>>> for el in range(5):
...     print(x)
... 
>>> total = 0
>>> for el in range(5):
...     total += el
... 
print(total)
```


Works for strings (which is a sequence)
```python
>>> word = ""
>>> for character in "Hello!":
...     word += character
...     print(character)
... 
>>> print(word)
```


Works for dictionaries
```python
>>> genetic_code = {'GUC': 'V', 'ACC': 'T', 'GUA': 'V'}
>>> for element in genetic_code:
...     print(element)
```
It's iterating over the keys!
```python
>>> genetic_code = {'GUC': 'V', 'ACC': 'T', 'GUA': 'V'}
>>> for element in genetic_code:
...     print(element, "-->", genetic_code[element])
```


We can also iterate over tuples of the key and value
```python
>>> genetic_code = {'GUC': 'V', 'ACC': 'T', 'GUA': 'V'}
>>> for key, value in genetic_code.items():
...     print(key, "-->", value)
```



# Defining functions


```python
>>> locals()
>>> def calc_square_prism_volume(square_length, height):
...     volume = (square_length ** 2) * height
...     print(locals())
...     return volume
...
>>> type(calc_square_prism_volume)
>>> locals()
```


```python
>>> calc_square_prism_volume(4, 10)
>>> locals()
>>> volume = calc_square_prism_volume(4, 10)
>>> locals()
>>> calc_square_prism_volume(10, 4)
>>> calc_square_prism_volume(height = 10, square_length=4)
>>> calc_square_prism_volume(square_length = 4, 10)
>>> calc_square_prism_volume(4, height = 10)
```


We can provide default values for parameters
```python
>>> def calc_square_prism_volume(square_length, height = 2.0):
...     volume = (square_length ** 2) * height
...     return volume
... 
>>> calc_square_prism_volume(4)
```



# Acknowledgments


## Material
These slides borrow heavily from notes
written by [Mark Holder](http://phylo.bio.ku.edu/content/mark-t-holder), which
can be found at <https://github.com/mtholder/eebprogramming>.


## Support
This work was supported by funding from the National Science Foundation (DEB
1656004).
