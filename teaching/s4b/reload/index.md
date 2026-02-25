---
layout: page
title: Reloading Python modules when tinkering with code
excerpt: "Learning to reload imported modules after changing code"
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

`importlib.reload` is a useful tool you can use within the Python interpreter
to test code you are writing in a file.
Let's start by writing a very simple Python script (module), named `hello.py`:

```python
#! /usr/bin/env python3

def hello(name = "you"):
    print("Hello")

# Always make your script a module with this if statement!
if __name__ == "__main__":
    hello()
```

Often, when we are working on code in a script, we want test it at the same
time from inside the Python interpreter.
Let's open the Python interpreter:

```bash
$ python3
```

and import the `hello.py` module we just created and try out the `hello`
function (NOTE: you will need to start the python interpreter from within the
same folder where you created the `hello.py` file):

```python
>>> import hello
>>> hello.hello()
Hello
```

Now, let's edit our `hello` function in the `hello.py` file:

```python
def hello(name = "you"):
    print("Hello,", name)
```

If we go back to our open Python interpreter and try our `hello` function
again, we will see that the edits we made in the file do not take effect,
because we imported the module **before** making the edits:

```python
>>> hello.hello()
Hello
```

However, we can use `importlib.reload` to reload our module and test the edited
version of our code:

```python
>>> import importlib
>>> importlib.reload(hello)
>>> hello.hello()
Hello, you
>>> hello.hello("dummy")
Hello, dummy
```

This allows us to tinker with our code from within the interpreter while we are
making edits.
