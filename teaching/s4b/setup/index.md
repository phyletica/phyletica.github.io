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
Rather, we are going to help you to establish an environment in which you are
comfortable working.
The tools you will need installed on your computer for this class are:

-   Unix-like shell (e.g., Bash)
-   Git
-   Python (Version 3)
-   A text editor

Below we provide some resources and recommendations for installing these tools
on Windows, MacOSX, and Linux.
However, you are certainly free to explore other configurations.


## Unix-like shell

### Windows

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

#### Windows Subsystem for Linux (WSL)

If you are using Windows 10, you have the option of installing a Linux
subsystem.
If you go this route, I recommend you install the Ubuntu distribution of Linux.
Here are links to instructions from Ubuntu and Microsoft:

-   [Instructions from Ubuntu](https://ubuntu.com/wsl).
-   [Instructions from Microsoft](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

#### Linux virtual machine

Using
[VirtualBox](https://www.virtualbox.org/)
you can install a Linux virtual machine for free.
[Click here for instructions on how to do so](https://itsfoss.com/install-linux-in-virtualbox/).
If you choose this route, I recommend you install the most recent version of
[Ubuntu Desktop](https://ubuntu.com/download/desktop).

#### Git BASH

If you don't want to install a Linux subsystem or virtual machine, another
option is to install a terminal emulator within Windows.

If you want to go this route, I recommend you install
[Git for Windows](https://gitforwindows.org/),
and follow
[these instructions from the Software Carpentries](https://carpentries.github.io/workshop-template/#shell).

After installing
[Git for Windows](https://gitforwindows.org/),
you will use the Git BASH tool to access a Bash-like command-line terminal.


### Mac

Just launch the `Terminal` application, which should be located in
`/Applications/Utilities`.


### Linux

Just launch the `Terminal` application.


## Git

### Windows

If you installed [Git for Windows](https://gitforwindows.org/), you already
have Git available in Git BASH.

If you installed the Linux subsystem or virtual machine, boot your Linux
environment and follow the instructions for Linux below.

### Mac

If you are using MacOSX, you have two options for getting Git:

1.  Install Xcode from the App Store, OR
2.  Go to [git-scm.com](https://git-scm.com/) and download and run the
    installer for your version of MacOSX.

### Linux

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
 

## Python

For this class, I recommend you install Version 3 of Python via
[Anaconda](https://www.anaconda.com/products/individual)
or its smaller cousin,
[miniconda](https://docs.conda.io/en/latest/miniconda.html).

[Anaconda](https://www.anaconda.com/products/individual)
installs Python and a bunch of popular Python packages,
many of which you will probably never use.
[Miniconda](https://docs.conda.io/en/latest/miniconda.html) is the same as
Anaconda, but without all the extra packages (and it's easy to install the
packages you do need).

Either is fine, but I recommend 
[Miniconda](https://docs.conda.io/en/latest/miniconda.html),
because it will install much faster and take up less disk space.


### Windows

If you installed the Linux subsystem or virtual machine, boot your Linux
environment and **follow the instructions for Linux below**.

If you installed [Git for Windows](https://gitforwindows.org/),.
[follow these instructions from the Software Carpentries](https://carpentries.github.io/workshop-template/#python)
to install Anaconda or miniconda.
The most important part of these instructions is to make sure to check `Add
Anaconda to my PATH environment variable` during the install;
this will make Python "visible" to Git BASH.
**NOTE:** The instructions on the Software Carpentries website are for
Anaconda, but should also work for miniconda.

After miniconda is installed, I highly recommend that you install the
``conda-bash-completion`` package that allows you to use tab completion when
typing conda commands. You can do so by typing the following at the Git BASH
command line:

~~~ bash
conda install -c conda-forge conda-bash-completion
~~~

### Mac

[Go here](https://docs.conda.io/en/latest/miniconda.html)
and download the
MacOSX installer for Python 3.

If you download `Miniconda3 MacOSX 64-bit pkg`, then double click the download
and install it like other software (you can accept all the default setting
during the installation).

If you download `Miniconda3 MacOSX 64-bit bash`,
then follow along with the Linux instructions to install it below; the
only difference is that the first command will be
`bash Miniconda3-latest-MacOSX-x86_64.sh`.

Either way, after it's installed, I highly recommend that you install the
``conda-bash-completion`` package that allows you to use tab completion when
typing conda commands. You can do so by typing the following at the command
line (i.e., `Terminal`):

~~~ bash
conda install -c conda-forge conda-bash-completion
~~~

### Linux

Download the [miniconda](https://docs.conda.io/en/latest/miniconda.html)
installation script with the following command:

    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

After this command finishes, you should be able to type:

    ls

and see `Miniconda3-latest-Linux-x86_64.sh` listed.
This is a shell script that will install miniconda.
To install it, run:

    bash Miniconda3-latest-Linux-x86_64.sh

You should see a prompt that looks something like:

    Welcome to Miniconda3 4.8.2
    
    In order to continue the installation process, please review the license
    agreement.
    Please, press ENTER to continue
    >>> 

Hit enter, then scroll down using the space bar or enter key until
you see the following prompt:

    Do you accept the license terms? [yes|no]
    [no] >>> 

Type "yes" and hit enter. Then, you will be prompted to choose the lcoation of
the installation:

    Miniconda3 will now be installed into this location:
    /home/jamie/miniconda3
    
      - Press ENTER to confirm the location
      - Press CTRL-C to abort the installation
      - Or specify a different location below
    
    [/home/jamie/miniconda3] >>> 

Simply hit enter to accept the default install location.
After a while (and lots of output), you should see the following prompt:

    Do you wish the installer to initialize Miniconda3
    by running conda init? [yes|no]
    [no] >>> 

Type "yes" and hit enter. This will add some code to your `.bashrc` file
that will make using `conda` simpler.

If all goes well, you should see:

    Thank you for installing Miniconda3!

at the bottom of the output.

Next, close your terminal window and open a new one.
Then, update `conda` by running:

    conda update conda

If there are updates available for `conda` you will be prompted with:

    Proceed ([y]/n)? y 

Type "y" (for yes) and hit enter to finish the update.

Lastly, I highly recommend that you install the `conda-bash-completion`
package that allows you to use tab completion when typing conda commands:

    conda install -c conda-forge conda-bash-completion


## Text editor

Most Unix-like shells already have text editors available that you can use
right in the command line, like `nano` and `vim`.
If you are comfortable using one of these, then there's no need to install a
text editor.
However, some people prefer a text editor with a graphical user interface (GUI)
and some extra bells and whistles.
Text editors with a lot of bells and whistles are often called
an integrative design environment (IDE).
Here are some popular and free options for text editors/IDEs, in no particular
order:

-   [Atom](https://atom.io/)
-   [Visual Studio Code](https://code.visualstudio.com/)
-   [Bluefish](http://bluefish.openoffice.nl/index.html)
-   [jEdit](http://www.jedit.org/)

Python-specific IDEs

-   [PyCharm](https://www.jetbrains.com/pycharm/)
-   [Jupyter Notebooks](https://jupyter.org/)

### Windows

If you are using Git for Windows (Git BASH), you already have `nano` available
in Git BASH.
If you want to install a fancier text editor, you will do so within Windows.

If you installed a Linux subsystem or virtual machine and want to install a
text editor, you will want to do so *within* the Linux environment.
