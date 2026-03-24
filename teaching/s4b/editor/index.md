---
layout: page
title: Guidance on text editors
excerpt: "Find a text editor you enjoy"
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

{% include _toc.html %}


An important part of coding is setting up a text editor you enjoy working in.
There are many options of text editors, and each of them have many
configuration options.
While this might seem overwhelming, having many options ensures that you can
find a text-editing environment in which you are comfortable and productive.
Below, I point you toward some options, but this is not meant to be exhaustive.

## Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com/) (or VS Code for short) is
a very popular, open-source text editor with a graphical user interface (GUI).

### Install VS Code on macOS

Here's a
[link to instructions for install VS Code on your mac](https://code.visualstudio.com/docs/setup/mac#_install-vs-code-on-macos).

### Install VS Code for WSL

If you are using the Windows Subsystem for Linux (WSL), you can install VS Code
in Windows and use it to edit files within the WSL subsystem.

[Here are some instructions for installing VS Code to edit code in WSL](https://code.visualstudio.com/docs/remote/wsl).
There is a lot of information at this link, but after you follow the
[3 installation steps](https://code.visualstudio.com/docs/remote/wsl#_installation),
you should be able to open files in VS Code from within the WSL terminal window using
the `code` command like:

    code the-file-you-want-to-edit.py


## Configuring nano

Many students like to use the `nano` text editor for class.
`nano` is a small, open-source, text editor that is available on most
Unix-like operating systems.
`nano` has a command line interface (CLI).

Depending on your system, `nano` might be minimally configured.
If you want to use it, it might be worth configuring `nano` by creating a
`.nanorc` file within your home folder.
Here is an example `.nanorc` configuration file to make `nano` more
user-friendly for editing python code:

    # Show line numbers by default
    set linenumbers
    
    # Use 4 spaces for indentation
    set tabsize 4
    set tabstospaces
    
    # Use auto indenting
    set autoindent
    
    ## Syntax highlighting for Python.
    
    syntax python "\.py$"
    header "^#!.*python"
    magic "Python script"
    comment "#"
    
    # Alternative linter: pylint --exit-zero
    linter pyflakes
    
    # Function definitions.
    color brightblue "def [0-9A-Za-z_]+"
    # Keywords.
    color brightcyan "\<(and|as|assert|async|await|break|class|continue)\>"
    color brightcyan "\<(def|del|elif|else|except|finally|for|from)\>"
    color brightcyan "\<(global|if|import|in|is|lambda|nonlocal|not|or)\>"
    color brightcyan "\<(pass|raise|return|try|while|with|yield)\>"
    
    # These two are keywords in Python 2, but functions in Python 3,
    # so only color them when they are followed by whitespace, assuming
    # that print(x) is a function invocation and print (x) is a statement.
    color brightcyan "\<(exec|print)([[:blank:]]|$)"
    
    # Special values.
    color brightmagenta "\<(False|None|True)\>"
    
    # Mono-quoted strings.
    color brightgreen "'([^'\]|\\.)*'|"([^"\]|\\.)*"|'''|""""
    color normal "'''|""""
    # Comments.
    color brightred "(^|[[:blank:]])#.*"
    # Triple-quoted strings.
    color brightgreen start="'''([^'),]|$)" end="(^|[^(\])'''"
    color brightgreen start=""""([^"),]|$)" end="(^|[^(\])""""
    
    # Backslash escapes.
    color lime "\\($|[\'"abfnrtv]|[0-3]?[0-7]?[0-7]|x[[:xdigit:]]{2})"
    color lime "\\(N\{[[:alpha:]]+\}|u[[:xdigit:]]{4}|U[[:xdigit:]]{8})"
    
    # Reminders.
    color brightwhite,yellow "\<(FIXME|TODO|XXX)\>"
    
    # Trailing whitespace.
    color ,green "[[:space:]]+$"

To try this out, copy and paste the text above into a file named `.nanorc` in
your home folder (usually `/home/<YOUR-USER-NAME>`).
If in doubt about where your home folder is, you can use the following shell
command to know for sure:

    echo $HOME

When you open `nano` it will read and use the settings specified in the
`~/.nanorc` file.


## Configuring vim

`vim` is another open source, CLI text editor.
I love it, but it is different and has a steep learning curve.
If you are not familiar with `vim`, I do NOT recommend you use it if you are
learning to code.
Learning to use `vim` might get in your way of learning to code.

However, if you would like to use `vim`, you can configure it using a `.vimrc`
file in your home folder.
Here are some settings you might want to put in your `~/.vimrc` file to make
coding in Python easier:

    syntax on
    
    " Use 4 spaces for indentation
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set softtabstop=4

    " Enable auto indentation for code
    set autoindent
    " Use smarter auto indentation
    set smartindent

    " Highlight matching brackets
    set showmatch

    
    " Display the current line and column number in bottom-right corner of window
    set ruler

    " Show lumbers along left edge
    set number
    
    " Maintain two lines of context when scrolling
    " If you want to keep your cursor centered at all times, you can set this
    " to a very large number, like: set scrolloff=999
    set scrolloff=2
    
    " Enable language-dependent indenting
    filetype plugin indent on
    
    " Enable incremental searching and highlighting of search matches
    set incsearch
    set hlsearch
