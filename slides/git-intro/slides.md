# Intro to Git


<a href="http://www.phdcomics.com"><img src="images/phd101212s.png" alt="Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com/comics/archive_print.php?comicid=1531" style="max-height: 500px;" /></a>

<http://www.phdcomics.com>


<iframe src="//www.slideshare.net/slideshow/embed_code/key/ddB3Ym1ynsNqhc?startSlide=111" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/chacon/git-101-presentation" title="Git 101 Presentation" target="_blank">Git 101 Presentation</a> </strong> from <strong><a target="_blank" href="//www.slideshare.net/chacon">Scott Chacon</a></strong> </div>


<iframe src="//www.slideshare.net/slideshow/embed_code/key/ddB3Ym1ynsNqhc?startSlide=343" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/chacon/git-101-presentation" title="Git 101 Presentation" target="_blank">Git 101 Presentation</a> </strong> from <strong><a target="_blank" href="//www.slideshare.net/chacon">Scott Chacon</a></strong> </div>


<iframe src="//www.slideshare.net/slideshow/embed_code/key/ddB3Ym1ynsNqhc?startSlide=346" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/chacon/git-101-presentation" title="Git 101 Presentation" target="_blank">Git 101 Presentation</a> </strong> from <strong><a target="_blank" href="//www.slideshare.net/chacon">Scott Chacon</a></strong> </div>



# Setting up Git


```
$ git config --global user.name "Jamie R. Oaks"
$ git config --global user.email "joaks1@gmail.com"
```


```
$ git config --list
```


If you ever need help with a git command:

```
$ git config -h
$ git config --help
```


```
$ git config --global core.editor "nano -w"
```


Let git use pretty colors when it tells you stuff

```
$ git config --global color.ui "true"
```

[Lots of other options](http://swcarpentry.github.io/git-novice/02-setup/)


```
$ git config --list
```



# Creating a repository


Create a directory we want to version control and `cd` into it

```
$ mkdir aubb-git-fun
$ cd aubb-git-fun
```

Tell git to make a repository of this directory

```
$ git init
```


Check the status of your new repo

```
$ git status
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

Very useful! It let's you see how git views the current state of the directory
that corresponds your repo


```
$ echo "Hello" > dummy.txt
$ echo "This is a second line" >> dummy.txt
$ echo "This is a third line" >> dummy.txt
```


Let's check what git thinks

```
$ git status
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	dummy.txt

nothing added to commit but untracked files present (use "git add" to track)
```


```
$ git add dummy.txt
```

```
$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   dummy.txt
```


You can do 

```
$ git commit -m "Adding file dummy.txt"
```

But, it's better to get in the habit of

```
$ git commit
```


## Commit message best practices

```
A short summary of the changes you are committing.

A longer explanation of the changes you made and why you made
them. Get in the habit early of writing informative commit
messages. Trust me, you will thank yourself later!

All tests passing.

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
#
# Initial commit
#
# Changes to be committed:
#   (use "git rm --cached <file>..." to unstage)
#
#	new file:   hello_world.py
#
```


```
$ git commit
[master (root-commit) 10b18f5] Adding dummy.txt file.
 1 file changed, 3 insertions(+)
 create mode 100644 dummy.txt
```


```
$ git log
```



## Basic Workflow

<ul>
	<li class="fragment fade-up">Edit files</li>
	<li class="fragment fade-up">Stage your changes (`git add`)</li>
	<li class="fragment fade-up">Review your changes (`git status`)</li>
	<li class="fragment fade-up">Commit your changes (`git commit`)</li>
</ul>


## Short Workflow

<ul class="fragment fade-up">
	<li>Edit files</li>
	<li>Stage and commit changes (`git commit -a`)</li>
</ul>

