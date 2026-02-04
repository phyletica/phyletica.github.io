---
layout: page
title: Topic 4.5 &mdash; Using GitHub-flavored markdown
excerpt: "Learning how to render markdown text on GitHub"
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

GitHub will automatically render nice HTML for any files in git repos with a
markdown extension (`.md`).
More specifically, for any `README.md` files, GitHub will automatically render
them (without having to click on them).

Here's a quick demo of this behavior.

Create a new directory on your computer, move into it and create a new git
repository:

    mkdir ~/github-markdown-demo
    cd ~/github-markdown-demo
    git init

Create a `README.md` file inside your new git repo:

    touch README.md

Open it with your preferred text editor and add some text in markdown format:

    # This is a section header
    
    ## This is a subsection header
    
    ### This is a subsubsection header
    
    Here's a list:
    
    -   Item 1
    -   Item 2
    
    Here's a list of links to Markdown resources:
    
    -   [Jamie's markdown notes](https://github.com/joaks1/markdown-notes)
    -   [Basics of GitHub-flavored markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
    -   [Full spec for GitHub-flavored markdown](https://github.github.com/gfm/)

Add your README.md file to the staging area of your repo:

    git add README.md

And commit it to your repo's database:

    git commit -m "Adding README.md"

Log in to your GitHub account and click the "New" button to create a new repo.
You can name it whatever you want, but I will use "github-markdown-demo".

Add your new GitHub repo as the remote copy "origin" of your local git repo:

    git remote add origin THE-URL-TO-YOUR-NEW-REPO-ON-GITHUB 

Rename the default branch of your local repo to "main" (if it's already main,
you can skip this, but if you do run this command, it won't do anything):

    git branch -M main

Push your local copy of your git repository to the remote location on GitHub:

    git push -u origin main

Note, the `-u` option sets the default upstream branch for pushing/pulling
(fetching).
For example, after setting it, git will assume `git push` means `git push
origin main`.

Go back to GitHub and refresh the page for the new repo. You should see the
markdown-formatted text you entered in the `README.md` file rendered as HTML on
GitHub.

Next, try adding another markdown-formatted text file to your repo; maybe call
it `dummy.md`.
When you push it to GitHub, it won't render automatically (it only does that
for "README" files), but it will if you click on the file name.


# Markdown resources

-   [Jamie's markdown notes](https://github.com/joaks1/markdown-notes)
-   [Basics of GitHub-flavored markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
-   [Full spec for GitHub-flavored markdown](https://github.github.com/gfm/)
