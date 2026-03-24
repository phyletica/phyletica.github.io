---
layout: page
title: Topic 1 &mdash; Getting set up 
excerpt: "Setting up our computational environment."
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

{% include _toc.html %}

Because our ultimate goal is for you to continue using computational skills
beyond this course, we are not going to force you to use a ``pre-cooked''
computer environment in the form of a container or virtual machine.
Nor will we use a web-based learning platform that doesn't enable you to easily
*apply* what you are learning.
Rather, we are going to help you establish an environment in which you are
comfortable learning and applying the skills you're developing.

The tools you will need installed on your computer for this class are:

-   [Unix-like shell (e.g., Bash or Zsh)](#1-unix-like-shell)
-   [Git](#2-git)
-   [A free GitHub account](#3-github-account)
-   [Conda package manager](#4-conda-package-manager)
-   [A plain text editor](#5-text-editor)

Below we provide some resources and recommendations for installing these tools
on Windows, Mac OSX, and Linux.
However, you are certainly free to explore other configurations, as long as you
have a unix-like shell with access to `conda` and `git`,
and a text editor.

If you don't have a laptop that can install these tools, please let me know
ASAP.
AU has Linux servers we can likely get you setup on.


# 1. Unix-like shell

A Unix-like shell is a command-line interpreter that allows you to interface
with Unix-like operating systems (e.g., Linux, BSD, Mac OS).

## 1.1. Windows

If you are using Windows, you have several options for installing a Unix-like
shell.
Below, we provide information on three options.
The first two options essentially install a full working version of the Linux
operating system.
The last option installs Git BASH, a Bash emulator within Windows.

**NOTE:** The option you choose will affect how you will install Git, Python,
and a text editor below:

-   **Subsystem or virtual machine**: Install Git, Python, and text editor
    **within the Linux environment**.
-   **Git BASH**:, You already have Git. Install Python so that it is "visible"
    to Git BASH (see below). If you choose to install a text editor, do so
    **within Windows**.

### 1.1.1 Windows Subsystem for Linux (WSL)

If you are using Windows 10 or greater, you have the option of installing a
Linux subsystem.
If you go this route, I recommend you install the Ubuntu distribution of Linux.
Here are links to instructions from Ubuntu and Microsoft:

-   [Instructions from Ubuntu](https://documentation.ubuntu.com/wsl/latest/howto/install-ubuntu-wsl2/).
-   [Instructions from Microsoft](https://learn.microsoft.com/en-us/windows/wsl/install).


### 1.1.2. Linux virtual machine

Using
[VirtualBox](https://www.virtualbox.org/)
you can install a Linux virtual machine for free.
[Click here for instructions from Ubuntu to install VirtualBox and Ubuntu](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox).
If you choose this route, I recommend you install the most recent version of
[Ubuntu Desktop](https://ubuntu.com/download/desktop).

### 1.1.3. Git BASH

If you don't want to install a Linux subsystem or virtual machine, another
option is to install a terminal emulator within Windows.

If you want to go this route, I recommend you install
[Git for Windows](https://gitforwindows.org/),
and follow
[these instructions from the Software Carpentries](https://carpentries.github.io/workshop-template/#shell).

After installing
[Git for Windows](https://gitforwindows.org/),
you will use the Git BASH tool to access a Bash-like command-line terminal.


## 1.2. Mac

Just launch the `Terminal` application, which should be located in
`/Applications/Utilities`.


## 1.3. Linux

Just launch the `Terminal` application.


# 2. Git

Git is a free and open-source version-control system used to track changes in
text files.
We will be using it extensively throughout the semester.

## 2.1. Windows

If you installed [Git for Windows](https://gitforwindows.org/), you already
have Git available in Git BASH.

If you installed the Linux subsystem or virtual machine, boot your Linux
environment and follow the instructions for Linux below.

## 2.2. Mac

If you are using MacOSX, you have two options for getting Git:

1.  Install Xcode from the App Store, OR
2.  Go to [git-scm.com](https://git-scm.com/) and download and run the
    installer for your version of MacOSX.

## 2.3. Linux

You might already have Git. At the command line, try:

~~~ bash
git --version
~~~

If you get a `command not found` error, use your Linux distribution's package
manager to install Git.
If you are using a Debian derivative of Linux (e.g., Ubuntu), you can
get Git by typing the following at the command line:

~~~ bash
sudo apt-get install git
~~~


# 3. GitHub account

[GitHub](https://github.com/) is a web-based platform for hosting Git repositories.
You will need to [create a free account on GitHub](https://github.com/), if you
don't already have one.

Once you have a GitHub account, follow
[these instructions for setting up SSH keys for your account]({{ site.baseurl }}/teaching/s4b/ssh-keys).

 
# 4. Conda package manager

Conda is a free and open-source package and environment manager that supports
many coding languages, including Python and R.

There are several flavors of conda package management and associated channels:
Conda-forge, Miniforge, Anaconda, Miniconda, Micromamba...
If you already have one of these installed and are comfortable using it, you
can probably skip this section and continue using the conda management system
you already have for this course.

Below, I provide instructions for installing Miniforge.
In my opinion, this is the best option in terms of open licensing and avoiding
bloat (not installing a bunch of stuff you'll never use).


## 4.1. Windows

If you installed the Linux subsystem or virtual machine, boot your Linux
environment and **follow the instructions for Linux below**.

If you installed "Git for Windows",
[follow these instructions from the Software Carpentries](https://carpentries.github.io/workshop-template/#python)
to install Miniforge.
The most important part of these instructions is to make sure to check the "Add
Miniforge3 to my PATH environment variable" option during installation;
this will make Miniforge tools "visible" to Git BASH.

Once installed, follow the instructions below to
[configure your conda installation](#43-configure-your-conda-installation)
and
[create a conda environment for this class](#44-create-a-conda-environment-for-this-class).


## 4.2. Linux, Mac OSX, or WSL

### 4.2.1 Make sure you have curl or wget

We will be using either `curl` or `wget` to download the script for installing
Miniforge,
so first, we need to check if either of these is installed.
Open your shell terminal (`Terminal` application) and check to see if you have
`curl`:

~~~ bash
which curl
~~~

If this produces a line of text that looks something like `/usr/local/bin/curl`
(any text like this), you have `curl` installed.
If you see no output, you don't have `curl`.

You can check for `wget` in the same way:

~~~ bash
which wget
~~~

Again, any text output like `usr/local/bin/wget` indicates `wget` is installed;
no output indicates it is not installed.

**You only need one of them to be installed**.
If neither is installed,

-   If you're using Mac OSX, install XCode via the app store; this will install
    `curl`.
-   If you're using Linux (either directly or via WSL), use your package manager
    to install them. For Ubuntu (or other Debian-based Linux distributions),
    you can do this via:

    ~~~ bash
    sudo apt-get install curl wget
    ~~~

### 4.2.2. Install Miniforge

Use `curl` or `wget` to download the Miniforge installation script.
Open your shell terminal (`Terminal` application), and use one of the following
commands depending on whether `curl` or `wget` is installed (if both are
installed, you can flip a coin):

~~~ bash
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
~~~

OR

~~~ bash
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
~~~

These are long commands, so you probably want to copy and paste these into your
command line.

Now, run the script you downloaded with this command:

~~~ bash
bash Miniforge3-$(uname)-$(uname -m).sh
~~~

After running the command above, you should see a prompt that looks something
like:

    In order to continue the installation process, please review the license
    agreement.
    Please, press ENTER to continue
    >>> 

Hit enter, then you should see the following prompt:

    Do you accept the license terms? [yes|no]
    >>> 

Type "yes" to accept the terms and hit enter.
Then, you will be prompted to choose the location of the installation:

    Miniforge3 will now be installed into this location:
    /arc/homes/jro0014/miniforge3
    
      - Press ENTER to confirm the location
      - Press CTRL-C to abort the installation
      - Or specify a different location below
    
    [/arc/homes/jro0014/miniforge3] >>> 

Simply hit enter to accept the default install location.
After a while (and lots of output), you should see the following prompt:

    Do you wish to update your shell profile to automatically initialize conda?
    This will activate conda on startup and change the command prompt when activated.
    If you'd prefer that conda's base environment not be activated on startup,
       run the following command when conda is activated:
    
    conda config --set auto_activate_base false
    
    Note: You can undo this later by running `conda init --reverse $SHELL`
    
    Proceed with initialization? [yes|no]
    [no] >>> 

Type "yes" and hit enter. This will add some code to your `.bashrc` file
that will make using `conda` simpler.

If all goes well, you should see:

    Thank you for installing Miniforge3!

at the bottom of the output.

Once installed, follow the instructions below to
[configure your conda installation](#43-configure-your-conda-installation)
and
[create a conda environment for this class](#44-create-a-conda-environment-for-this-class).


## 4.3. Configure your conda installation

Open a **new terminal window** and update your conda configuration to not auto
activate a conda environment every time you open an new terminal window:

~~~ bash
conda config --set auto_activate false
~~~

Close your terminal window and open a new one.
Next, update `conda` by running:

~~~ bash
conda update conda
~~~

If there are updates available for `conda` you will be prompted with:

    Proceed ([y]/n)? y 

Type "y" (for yes) and hit enter to finish the update.

Lastly, I highly recommend that you install the `conda-bash-completion`
package that allows you to use tab completion when typing conda commands:

~~~ bash
conda install -c conda-forge conda-bash-completion
~~~


## 4.4. Create a conda environment for this class

Let's create a conda environment we will all use during some of our in-class
demonstrations and exercises.
First, use `git` to clone a repository I created containing a YAML-formatted
file that specifies a conda environment:

~~~ bash
git clone https://github.com/joaks1/biol-7180-conda-env.git
~~~

Then, move into the downloaded directory and use `mamba` to create the
environment.
Note, `mamba` and `conda` are interchangeable in the command below, but `mamba`
is faster:

~~~ bash
cd biol-7180-conda-env
mamba env create -f conda-env.yml
~~~

You don't need to do this now, but when we want to use the conda environment,
we use the following command:

~~~ bash
conda activate biol-7180
~~~


# 5. Text editor

For this class, you will need a plain ("raw") text editor.

Most Unix-like shells already have text editors available that you can use
right in the command line, like `nano` and `vim`.
If you are comfortable using one of these, then there's no need to install a
text editor.
However, some people prefer a text editor with a graphical user interface (GUI)
and some extra bells and whistles.
Text editors with a lot of bells and whistles are often called
an integrative design environment (IDE).
If you prefer a GUI text editor over `nano` and `vim`, I recommend Visual
Studio Code (VS Code):

-   [Visual Studio Code](https://code.visualstudio.com/)

## 5.1. Windows

If you are using Git for Windows (Git BASH), you already have `nano` available
in Git BASH.
If you want to install a fancier text editor, you will do so within Windows.

If you are using Windows Subsystem for Linux (WSL), depending on the text
editor, you might need to install it within Windows or within the Linux
subsystem.
For VS Code, you will want to install it within Windows.

If you installed a Linux virtual machine and want to install a text editor, you
will want to do so *within* the Linux virtual machine.

## 5.2 More guidance about text editors

Here is a
[link to some additional guidance about text editors]({{ site.baseurl }}/teaching/s4b/editor).

