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

<ul>
	<li class="fragment fade-up">An *object* is created with value 1.5</li>
	<li class="fragment fade-up">An *object* is created with value 2</li>
	<li class="fragment fade-up">The product operation is evaluated, returning a new object with value 3.0</li>
	<li class="fragment fade-up">The object with value 3.0 is assigned ("bound to") the name "radius"</li>
</ul>


<ul>
	<li class="fragment fade-up">
        The *type* of all of these objects is determined dynamically by the
        Python interpreter
    </li>
	<li class="fragment fade-up">
        Python has many types
    </li>
    <ul>
        <li class="fragment fade-up">
            You can create your own!
        </li>
    </ul>
	<li class="fragment fade-up">
        Common types include integers, float, strings, and Booleans
    </li>
	<li class="fragment fade-up">
        Compared to a statically typed language
    </li>
</ul>


<ul>
	<li>
        Compared to a statically typed language, this means less typing for you
    </li>
	<li class="fragment fade-up">
        It also can make Python code very flexible
    </li>
	<li class="fragment fade-up">
        However, getting familiar with *types* and how *objects* are bound to
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
>>> 8 // 3  # floor division
>>> 8 % 3   # modulo
>>> 2 ** 3  # base ** exponent
```



# Functions


A useful example is `print`
```python
>>> print("any", "number of", "arguments", 1, 2, 3.0)
>>> print("any", "number of", "arguments", 1, 2, 3.0, sep="--")
>>> print("any", "number of", "arguments", 1, 2, 3.0, sep = "--", end = "\n\n\n")
```



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
We wouldn't normally use `locals()` when scripting
</p>



# Let me out!


```python
>>> quit()
```



# Scripts


An important difference from BASH is the best practice for the shebang line
```python
#! /usr/bin/env python3
```
