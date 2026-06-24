---
layout: page
title: Configuring Git
excerpt: "Setting up our computational environment."
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---


Before using Git, you will want to configure it.
You will want to do this on any machine on which you plan to use git.
For example, if you plan to use git on your laptop and a remote server (e.g.,
your HPC cluster account), do the following configuration steps on your laptop
and server account.


## Provide your basic info to git

First, provide git with your name and email with the following command
(but use your name and email, of course).
This information is used to annotate the content you add to any git repository.

```
git config --global user.name "Augusta A. King"
git config --global user.email "motherofcoding@gmail.com"
```

If you have a GitHub account, tell git your username:

```
git config --global github.user "ada1815"
```

## Configure git's 'pull' behavior

Traditionally, the command `git pull` was an alias for two commands:
`git fetch` and `get merge`.
However, it's also possible to `rebase` instead of `merge`, but you are still
learning to use git, you almost certainly don't want to use `rebase` by
default.
To make sure `git pull` is configured sanely, I recommend you enter these two
commands:

```
git config --global pull.rebase false
git config --global pull.ff true
```

This will cause git to follow the traditional behavior of running `git fetch`
and `git merge` whenever you use `git pull`.


## Configure git to use your preferred text editor

When you commit content to a git repository, you need to provide a message
about the content your adding and/or the work you have done.
By default, git will open the vim text editor for you to type this message.
However, if you are not familiar with vim, it can be quite disorienting.
If you are not familiar with using vim, I recommend you configure git to use a
different text editor.

For example, if you want git to open nano for you when you need to type a
message, use the following command:

```
git config --global core.editor "nano -w"
```

If you prefer to use VS Code, use this command instead:

```
git config --global core.editor "code --wait"
```

There are
[lots of other options](https://swcarpentry.github.io/git-novice/02-setup.html)
for configuring git to use other text editors.


## Colorful output from git

Allow git to use pretty colors when it tells you stuff

```
git config --global color.ui "true"
```


## Other resources

[Software carpentry]()
has a nice page about configuring git.
You can find that at:

-   <https://swcarpentry.github.io/git-novice/02-setup.html>
