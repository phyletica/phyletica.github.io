---
layout: page
title: Reproducible research with conda
excerpt: "Using conda to make your work more reproducible"
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

{% include _toc.html %}


As scientists, we should strive to make our computational work as
repeatable as possible.

# The spectrum of reproducible practices

There is a broad spectrum of practices for making our work more reproducible.
At one extreme,
we can simply provide of the list of tools and packages we installed to get our
code and analyses to work.
While this is better than nothing, we should strive to do better than this.
At the other extreme,
we can use a tool like
[Docker](https://www.docker.com/),
[Singularity](https://docs.sylabs.io/guides/3.5/user-guide/introduction.html),
or
[Podman](https://podman.io/)
to bundle a full, project-specific computing environment (code, system tools,
libraries, settings) into a container,
and use that container to perform all the analyses for our project.
This is wonderful, but is likely overkill for many projects.
Below, I describe how to use conda environments to get as close to the
container end of this spectrum as possible, but without investing a lot effort
or resources.

## A quick aside

In terms of reproducibility,
I am focusing ***only*** on how to manage the computing environment for a
project.
You should also version-control your computational work using a tool
like
[Git](https://git-scm.com/)!
I am ignoring that here, because the focus is on conda, but it's super
important.


# What is conda?

Conda is an open-source, cross-platform software package (and environment)
management system.


# Why conda?

There are many software package managers available;
for example,
Python has
[pip](https://pypi.org/project/pip/),
[Poetry](https://python-poetry.org/),
and
[uv](https://docs.astral.sh/uv/),
and R has
[renv](https://rstudio.github.io/renv/articles/renv.html).
So, why use conda?

For me, the main advantage of conda is that it is language-agnostic.
I use conda to manage Python, R, ruby, java, and C/C++ dependencies;
even system tools like Git and C/C++ compilers!
This allows you to get close to container-level reproducibility with less
effort.


# Which conda?

Conda is distributed with a number of different package management systems.
If you're new to conda, I recommend installing
[Miniforge](https://conda-forge.org/download/).
I provide
[instructions for installing Miniforge here]({{ site.baseurl }}/teaching/s4b/setup/#4-conda-package-manager).


# How to use conda well for a project?

Below, I layout my general workflow for using conda throughout the lifespan of
a research project.
This is not the only way to use conda, and probably not the "best",
but after many years of trial and error, I think it's a pretty good approach to
make your projects more reproducible.

## Starting a new project

When starting a new project, the first thing I do (after creating the project
git repository) is create a YAML-formatted file that specifies how to create
a computing environment for the project using Conda.
You can name this file whatever you want, but Conda's default name for such
an environment file is `environment.yml`.

Here's an example of what this `environment.yml` might look like:

    name: gecko-project
    channels:
      - conda-forge
    dependencies:
      - git=2.53.0
      - cxx-compiler=1.11.0
      - cmake=4.2.3
      - python>=3.8
      - r-base
      - r-ggplot2
      - quarto
      - iqtree
      - pyyaml
      - scipy
      - numpy
      - matplotlib
      - seaborn
      - munkres>=1.1.1
      - scikit-learn

The `name:` specifies what we want to call the conda environment for this project.
Under `dependencies:`, we list all of the packages we want to install in
this project's conda environment.
The `channels:` section tells conda where we want to look for those packages.

**Best practices when creating the initial environment.yml**:

-   Try to include all the packages you will need for this project
-   Try not to include extra stuff you won't need
-   Try to be specific about version numbers
-   Version control the `environment.yml` file (e.g., using git) as part of
    your project

**BUT**, 
the project hasn't started yet, so you might not know all the packages you'll
need and what version numbers.
**That is OK!**
Below, we'll learn how to update our conda environment along the way and
capture all the version numbers once our environment has "fully matured."

### Using conda to create the environment for the new project

Once you've created your `environment.yml` file, you can use conda to create
the environment with the following command:

    conda env create --file environment.yml

Once conda finishes creating the new environment, we can activate it with the command:

    conda activate gecko-project

### How to run analyses in the environment from a shell script

We might want to run analyses for our project using a shell (e.g., Bash)
script, so that we can submit the analysis as a job on an HPC computing
cluster.
When we do this, the `gecko-project` environment won't be active when the shell
script is being run.
The best way around this problem is to use the `conda run` command in your
shell script.

For example,
let's say I want to run an analysis using the `iqtree` program that I installed
in my `gecko-project` conda environment.
If I was working directly on the command line, I would first activate the
project's conda environment
using `conda activate gecko-project` and then run iqtree using a command like
`iqtree -s gecko-dna-sequences.txt`.
However, if I want to run iqtree from within a shell script, I would use the
following command within the shell script:

    conda run -n gecko-project iqtree -s gecko-dna-sequences.txt

The `conda run -n gecko-project` part of this command will ensure that the rest
of the command (`iqtree -s gecko-dna-sequences.txt`) gets executed within the
`gecko-project` conda environment.


## How to update your project's conda environment?

Midway through working on our project, we realize we need a tool that is not
part of project's conda environment.
We can easily fix that.
Using the `gecko-project` environment specified above as an example, let's say
we realize that we want to use pytorch in our project,
and we no longer need quarto.
First, we add pytorch to, and remove quarto from, our `environment.yml` (make
sure you version-control these updates with git!):

    name: gecko-project
    channels:
      - conda-forge
    dependencies:
      - git=2.53.0
      - cxx-compiler=1.11.0
      - cmake=4.2.3
      - python>=3.8
      - r-base
      - r-ggplot2
      - iqtree
      - pyyaml
      - scipy
      - numpy
      - matplotlib
      - seaborn
      - munkres>=1.1.1
      - scikit-learn
      - pytorch

Second, we use the following command to have conda update the `gecko-project`
environment:

    conda env update --name gecko-project --file environment.yml --prune

The `--prune` option tells conda to remove any packages that are no longer
required from the project's environment.
If you make a bunch of changes to your conda environment, it might be easier to
simply rebuild the project's conda environment from scratch:

    conda env create --name gecko-project --file environment.yml --force

The `--force` option tells conda to remove the existing `gecko-project`
environment before creating it anew.


## Preserving a more precise version of your project's environment

As your project and its conda environment start to mature, you can record a
more precise version of your project's conda environment
using the following command:

    conda env export --name gecko-project --no-builds | grep -v "^prefix:" > precise-environment.yml

You can do this periodically throughout the lifespan of the project.
You should version-control the `precise-environment.yml` (you can name it
whatever you want) file with git.
In the documentation for your project, you should explain the purpose
of both YAML-formatted environment files (`environment.yml` and
`precise-environment.yml` in our example above).
You can describe how `environment.yml` was used to create the project's
conda environment,
and `precise-environment.yml` is a detailed snapshot of the full environment.

Someone trying to reproduce your work should create the project environment
from the fully detailed `precise-environment.yml` file.


# Additional resources

For writing out how I use conda,
I found these two resources from
[The Carpentries Incubator](https://carpentries-incubator.org/)
useful:

-   [Sharing conda environments](https://rse.shef.ac.uk/conda-environments-for-effective-and-reproducible-research/04-sharing-environments/index.html)
-   [Working with conda environments](https://carpentries-incubator.github.io/introduction-to-conda-for-data-scientists/02-working-with-environments/index.html)
