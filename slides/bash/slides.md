# Intro to Bash

---

<ul>
	<li>
        Most people communicate with their computer through graphical user
        interfaces (GUI)
    </li>
	<li class="fragment fade-up">
        These GUIs are translators
        <ul>
            <li>
                Translates your clicks into instructions
            </li>
        </ul>
    </li>
	<li class="fragment fade-up">
        Works well for simple tasks, but does not scale well
        <ul>
            <li>
                E.g., what if you need to gather info from 1000
                files?
            </li>
            <li>
                Click, click, click &#8230;
            </li>
        </ul>
    </li>
</ul>

---

<ul>
	<li class="fragment fade-up">
        If you vacation in a foreign country, a translator is very helpful
    </li>
	<li class="fragment fade-up">
        But, what if you move to that country for a job in which you interact
        with hundreds of people every day?
    </li>
	<li class="fragment fade-up">
        A translator only gets you so far
    </li>
	<li class="fragment fade-up">
        We want to learn the language used by the GUI to talk (more) directly
        to our computer
    </li>
</ul>

---

## About these slides

I use "<code>$</code>" at the beginning of lines to signify that we are typing at the
command prompt

```bash
$ echo "Hello World!"
```


***

# Anatomy of a command

---

```bash
$ echo -e "Hello, World!"
```

<dl>
    <dt class = "fragment fade-up">
        <code>echo</code>
    </dt>
        <dd class = "fragment fade-up">
            Command (program)
        </dd>
    <dt class = "fragment fade-up">
        <code>-e</code>
    </dt>
        <dd class = "fragment fade-up">
            Option or "flag"
        </dd>
    <dt class = "fragment fade-up">
        <code>"Hello, World!"</code>
    </dt>
        <dd class = "fragment fade-up">
            Argument
        </dd>
<dl>


---

### Getting help with a command


```bash
$ man echo
```

<ul>
	<li class="fragment fade-up">
        This shows the manual for the <code class="ilcode">echo</code> command
    </li>
    <ul>
    	<li class="fragment fade-up">
            Navigate with arrow keys (or 'j'/'k')
        </li>
    	<li class="fragment fade-up">
            Press 'q' to exit the manual
        </li>
    </ul>
	<li class="fragment fade-up">
        Note, <code>man</code> is the command (program)
        and <code>echo</code> is an argument
    </li>
</ul>


***

# File System & Paths

---

```bash
$ pwd
$ ls /
$ ls /home
$ ls /home/jamie
$ ls
```
---

```bash
$ mkdir foo bar
$ cd foo
$ pwd
$ cd ..
$ pwd
$ cd /home/jamie/foo
$ pwd
$ cd ..
```
---

```bash
$ cd foo
$ pwd
$ cd ../bar # same as cd /home/jamie/bar
```

```bash
$ cd
$ pwd
$ cd ~
$ pwd
$ cd $HOME
$ pwd
$ echo $HOME
```

```bash
$ cd foo
$ cd ~/bar # same as ../bar or /home/jamie/bar
```


***

# What *are* commands?

---

-   They are just programs!
    -   Files on your computer that can be executed


---


```bash
$ which pwd
$ which ls
$ ls
$ /usr/bin/ls
$ which which
```

---

-   The reason you don't have to type `/usr/bin/ls` is because `/usr/bin` is in your `PATH`

```bash
$ echo $PATH
```

-   When you type `ls`, Bash will look for it in these directories


***

# Resources 

---

Here's a nice lesson from Software Carpentries

<http://swcarpentry.github.io/shell-novice/>


***

# Acknowledgments

---

## Support
This work was made possible by funding provided to [Jamie
Oaks](http://phyletica.org) from the National Science Foundation (DEB 1656004).
