# Intro to Git

Jamie Oaks

[@jamoaks](https://twitter.com/jamoaks) | [phyletica.org](http://phyletica.org) | GitHub: [joaks1](https://github.com/joaks1)

<a href="http://phyletica.org/slides/git-intro"><img src="../images/qr-code-git-intro.png" alt="QR Code" style="border:5px solid black;max-height: 150px;" /></a>


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


If you have a GitHub account, tell git your username:

```
git config --global github.user "joaks1"
```


```
$ git config --global core.editor "nano -w"
```

[Lots of other options](http://swcarpentry.github.io/git-novice/02-setup/)


Allow git to use pretty colors when it tells you stuff

```
$ git config --global color.ui "true"
```


Let's create an alias while we're at it 

```
$ git config --global alias.dag "log --oneline --graph --decorate"
```


```
$ git config --list
```



# Creating a repository


Create a directory we want to version control and `cd` into it

```
$ mkdir git-intro
$ cd git-intro
$ mkdir first-git-repo
$ cd first-git-repo
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

<p class="fragment fade-up">
Very useful! It let's you see how git views the current state of the directory
</p>


Now, let's create some content
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


Now, let's **stage** `dummy.txt` for the next commit
```
$ git add dummy.txt
```

What does git see?
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


After running `commit` you should get output that looks something like
```
[master (root-commit) 10b18f5] Adding dummy.txt file.
 1 file changed, 3 insertions(+)
 create mode 100644 dummy.txt
```


```
$ git status
# On branch master
nothing to commit, working directory clean
```

<p class="fragment fade-up">
Your working directory matches the current snapshot (commit), and nothing is staged
</p>


```
$ git log
commit 61b8cd8e00a5bdf52cdfee66029c8fbde5c84f3b
Author: Jamie Oaks <jro0014@auburn.edu>
Date:   Thu Jun 8 09:06:35 2017 -0500

    Adding dummy.txt
    
    Adding new file and writing a long commit message to teach
    students good commit practices.
```
<p class="fragment fade-up">
<code>git log</code> shows you every commit from where you currently are back to the root
</p>
<p class="fragment fade-up">
This is your lab notebook!
</p>


## Basic Workflow

<ul>
	<li class="fragment fade-up">Edit files</li>
	<li class="fragment fade-up">Stage your changes (<code>git add</code>)</li>
	<li class="fragment fade-up">Review your changes (<code>git status</code>)</li>
	<li class="fragment fade-up">Commit your changes (<code>git commit</code>)</li>
</ul>


Now, let's update some content
```
$ echo "This is yet another line" >> dummy.txt
```

```
$ git status
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   dummy.txt
#
no changes added to commit (use "git add" and/or "git commit -a")
```


```
$ git diff
diff --git a/dummy.txt b/dummy.txt
index 5987551..67e03ef 100644
--- a/dummy.txt
+++ b/dummy.txt
@@ -1,3 +1,4 @@
 Hello
 This is a second line
 This is a third line
+This is yet another line
```
<p class="fragment fade-up">
<code>git diff</code> shows you differences between your working directory and the index (staging area)
</p>


```
$ git add dummy.txt
```
<p class="fragment fade-up">
Why are we adding <code>dummy.txt</code> again?
</p>
<p class="fragment fade-up">
We are adding new content to the staging area
</p>
<p class="fragment fade-up">
The git database tracks <b>content</b>, not <b>files</b> per se
</p>


```
$ git status
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#	modified:   dummy.txt
#
```


```
$ git diff
```

```
$ git diff --staged
diff --git a/dummy.txt b/dummy.txt
index 5987551..67e03ef 100644
--- a/dummy.txt
+++ b/dummy.txt
@@ -1,3 +1,4 @@
 Hello
 This is a second line
 This is a third line
+This is yet another line
```
<p class="fragment fade-up">
<code>--staged</code> option shows you differences between the staging area and the current commit 
</p>


Let's commit our staged content to the database
```
$ git commit
[WRITE YOUR COMMIT MESSAGE AND SAVE AND EXIT]
[master bfd1e58] Updating dummy.txt
 1 file changed, 1 insertion(+)
```

```
$ git status
$ git diff
$ git diff --staged
```


## Basic Workflow

<ul>
	<li class="fragment fade-up">Edit files</li>
	<li class="fragment fade-up">Stage your changes (<code>git add</code>)</li>
	<li class="fragment fade-up">Review your changes (<code>git status</code>)</li>
	<li class="fragment fade-up">Commit your changes (<code>git commit</code>)</li>
</ul>



# Branches


Let's add some HTML to our project
```
$ curl -o aubb.html http://phyletica.org/slides/git-intro/aubb.html
```


```
$ git add aubb.html
$ git commit
$ git log
```


```
$ git branch
* master
```
<p class="fragment fade-up">
We have a single branch called master 
</p>


Let's create three new branches
```
$ git branch cosmetic
$ git branch programs
$ git branch concise
```


```
$ git branch
  concise
  cosmetic
* master
  programs
```


Let's switch to the cosmetic branch
```
$ git checkout cosmetic
```

```
$ git branch
  concise
* cosmetic
  master
  programs
```


On 'cosmetic' branch, change

```
<html>
    <head>
        <title>AU Bioinformatics Bootcamp Dummy HTML page</title>
    </head>
    <body>
        <h1>This is a big header.</h1>
```
to

```
<html>
    <head>
        <title>AU Bioinformatics Bootcamp Dummy HTML page</title>
    </head>
    <body style="font-family: Comic Sans MS">
        <h1><font color="red">This is a big header.</font></h1>
```


```
$ git status
$ git diff
```


Stage changes for the next commit
```
$ git add aubb.html
$ git status
```


Commit snapshot to the repo database
```
$ git commit -m "Changing font and header color"
```


Let's switch to the programs branch
```
$ git checkout programs
```

<p class="fragment fade-up">
Are cosmetic changes still there? Why?
</p>


On 'programs' branch, change

```
      <td>Mapping stuff, Bowtie, variant calling</td>
  </tr>
  <tr>
      <td>June 8</td>
      <td>Interminable Git intro and seminar</td>
```
to

```
      <td>Mapping stuff, <b>Bowtie</b>, variant calling</td>
  </tr>
  <tr>
      <td>June 8</td>
      <td>Interminable <b>Git</b> intro and seminar</td>
```


```
$ git status
$ git diff
```

Stage changes for the next commit
```
$ git add aubb.html
$ git status
```

Commit snapshot to the repo database
```
$ git commit -m "Bolding program names"
```


```
$ git checkout concise
```

<p class="fragment fade-up">
Are cosmetic changes or bolded programs still there? Why?
</p>


On 'concise' branch, change

```
      <td>Mapping stuff, Bowtie, variant calling</td>
  </tr>
  <tr>
      <td>June 8</td>
      <td>Interminable Git intro and seminar</td>
```
to

```
      <td>Mapping, Bowtie, variant calling</td>
  </tr>
  <tr>
      <td>June 8</td>
      <td>Git intro and seminar</td>
```


```
$ git status
$ git diff
```

Stage changes for the next commit
```
$ git add aubb.html
$ git status
```

Commit snapshot to the repo database
```
$ git commit -m "Removing unnecessary verbiage"
```


## Merging our changes

```
$ git checkout master
$ git merge cosmetic
```

<p class="fragment fade-up">
What happened? Take a look at HTML code and refresh browser.
</p>


```
$ git merge programs
```

<p class="fragment fade-up">
What happened? Why?
</p>

<p class="fragment fade-up">
This combination of code never existed before, so we need a new snapshot
</p>


```
$ git merge concise
```

<p class="fragment fade-up">
Conflicts! Why?
</p>


Resolve flagged conflicts, and then
```
$ git add aubb.html
$ git commit -m "Manual merge"
```



# Time travel


```
$ git log
```

Get SHA for the first commit we made.


```
$ git checkout <SHA-OF-FIRST-COMMIT>
```

What happened?


Back to the future:

```
$ git checkout master
```



# Remotes


```
$ cd ~/git-intro
$ mkdir remote-repo
$ cd remote-repo
$ git init --bare
```


```
$ cd ..
$ mkdir bonnie
$ cd bonnie
```

```
$ git clone ../remote-repo
$ ls
$ cd remote-repo
$ git remote -v
```
<p class="fragment fade-up">
'origin' is the alias for the repo in the other directory
</p>


```
$ echo "Well hello again dummy" > dummy.txt
$ git add dummy.txt
$ git commit -m "Adding dummy.txt"
$ git status
```


Let's *push* our snapshot of the master branch to the remote repo called origin
```
$ git push origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 241 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To /home/aubjro/git-intro/local-demo/../remote-demo/
 * [new branch]      master -> master
```

```
$ git push <REMOTE-ALIAS> <BRANCH-NAME>
```


```
$ git branch -a
* master
  remotes/origin/master
```


```
$ git pull origin master
```

```
$ git pull <REMOTE-ALIAS> <BRANCH-NAME>
```

<p class="fragment fade-up">
What this does is <b>fetch</b> any new commits to the 'remote' branch
'origin/master' and then <b>merge</b> those new commits into the 'local' branch
'master'
</p>


The same as
```
$ git fetch origin master
$ git merge origin/master
```

This is longer, but sometimes it's nice to
```
$ git diff origin/master
```
before merging!


Now, let's pretend to be Bonnie's collaborator
```
$ cd ../..
$ ls
$ mkdir clyde
$ cd clyde
$ ls
$ git clone ../remote-repo
$ ls
$ cd remote-repo
```


As Clyde, let's add a line to dummy.txt
```
$ cat dummy.txt
$ echo "I'm no dummy" >> dummy.txt
$ git add dummy.txt
$ git commit -m "Adding line to dummy.txt"
$ git push origin master
```


Now, let's go back to being Bonnie
```
$ cd ../../bonnie/remote-repo
$ cat dummy.txt
$ git pull origin master
$ cat dummy.txt
```


Bonnie adds a comma

Open dummy.txt and change
```
Well hello again dummy
```
to

```
Well, hello again dummy
```

```
$ git add dummy.txt
$ git commit -m "Adding comma to dummy.txt"
$ git push origin master
```


Now, let's go back to being Clyde and add a comma
```
$ cd ../../clyde/remote-repo
```

Open dummy.txt and change
```
Well hello again dummy
```
to

```
Well hello again, dummy
```


Clyde tries to push his changes
```
$ git add dummy.txt
$ git commit -m "Adding comma to dummy.txt"
$ git push origin master
```

But,
```
To /home/jamie/git-intro/clyde/../remote-repo/
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to '/home/jamie/git-intro/clyde/../remote-repo/'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

Clyde needs to `pull` down Bonnie's changes first!


Let's `pull` down Bonnie's changes
```
git pull origin master
```
```
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From /home/jamie/git-intro/clyde/../remote-repo
 * branch            master     -> FETCH_HEAD
   afe295d..ad99087  master     -> origin/master
Auto-merging dummy.txt
CONFLICT (content): Merge conflict in dummy.txt
Automatic merge failed; fix conflicts and then commit the result.
```
We have a merge conflict, because Bonnie and Clyde both edited the same line!

```
$ git status
```


Now, as Clyde, we need to manually resolve this conflict

Open `dummy.txt` and you'll see
```
<<<<<<< HEAD
Well hello again, dummy
=======
Well, hello again dummy
>>>>>>> ad99087c06afffc6ab161a749e2b3ca16c092348
I'm no dummy
```
`git` has flagged the conflict with the
```
<<<<<<<
your content
=======
other content
>>>>>>>
```
notation


Edit `dummy.txt` to
```
Well, hello again, dummy
I'm no dummy
```

`add`, `commit`, and `push` your changes
```
$ git status
$ git add dummy.txt
$ git status
$ git commit -m "Resolving comma conflict"
$ git push origin master
```


Now, let's go back to being Bonnie
```
$ cd ../../bonnie/remote-repo
$ cat dummy.txt
$ git pull origin master
$ cat dummy.txt
```



# Best practices


Stay up-to-date (`git pull <REMOTE-ALIAS> <BRANCH>` often)

Commit often

Push often

Always pull (or fetch and merge) before pushing



# Exercise


<https://github.com/joaks1/au-bootcamp-git-intro>



# Resources 


<https://git-scm.com/docs>



# Acknowledgments


## Material
These slides were inspired by, and borrowed heavily from, the Git exercise
written by [Mark Holder](http://phylo.bio.ku.edu/content/mark-t-holder), which
can be found at <https://github.com/mtholder/swc-tree-support-ex>.


## Support
This work was made possible by funding provided to [Jamie
Oaks](http://phyletica.org) from the National Science Foundation (DEB 1656004).
