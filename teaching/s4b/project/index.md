---
layout: page
title: Class project
excerpt: "Project for Scripting for Biologists"
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

{% include _toc.html %}


# Overview

For your class project for *Scripting for Biologists*,
you will develop a script, or set of scripts, to simulate, process, and/or
analyze biological data.
Team members will work collaboratively via version-control software (Git) and
host your code in a repository on GitHub.
At the end of the semester, each team will give a short presentation in the
form of a workshop/tutorial.
The goal is for the team to guide the rest of the class through an example of
how to use their script(s).
The tutorial should have enough documentation to be self-contained; i.e., other
students should be able to complete the tutorial without the presentation.

If possible, we want this project to be applicable to your research.
To enable this, we will be flexible about how students assemble into teams.
Teams can consist of 1--5 students.


# Grading

A student's grade will be determined based on the quality of the project, the
ability of others to replicate their results, and their individual
contributions to the project (assessed by Git/GitHub's tracking of every line
of code written or modified by each contributor).
More specifically, the break down of your grade for the project will be as
follows:

| Component | Percent of grade |
| --------- | ---------------- |
| Code (including internal documentation) | 40% |
| External documentation (e.g., README, tutorial) | 30% |
| Presentation | 30% |


## Criteria for grading the code

-   Is the code easy to obtain and run?
-   Does the code follow the best practices we learn in class?
-   Has the team member made significant contributions to the code?

## Criteria for grading the external documentation

-   Does the documentation summarize the goals of the project, how they
    developed code to achieve those goals, and how the code works?
-   Does the documentation explain how to obtain and use the code?
-   Is there a tutorial that provides enough information for others to
    reproduce the project's analyses?

## Presentation

The length and format of the presentation will vary among semesters,
based on the size of the class and the number of groups.
However, the evaluation criteria will remain the same:

-   Does the team introduce the goals of their project, and how they used
    scripting to meet those goals?
-   Do they walk through how to obtain, install, and run the code, and provide
    enough information for others to do this successfully?
-   Do they walk through an example of how to use their code, and provide
    enough information for others to do this successfully?

### Is a full reproduction of the project necessary during the presentation?

No. If your project analyses take too long during a short tutorial,
your tutorial does not need to involve a full reproduction of the analyses.
However, try to use a "toy example" (e.g., using a small data set), so you can
still demonstrate how others could reproduce your analyses.


# Scripting languages

You are welcome to use any scripting language for your project.
However, you are expected to apply the skills and best practices you learn in
class to whatever language you use for the project.
All the best practices we learn in *Scripting for Biologists* using Python are
transferable to other scripting languages.

Some examples of best practices we will learn and are transferable to any
scripting language include:

-   Making your code modular so that it is easier to understand and reuse 
-   Making your code expressive (e.g., using descriptive names for variables,
    functions, and classes)
-   Writing good documentation within your code (e.g., docstrings in Python)

Most languages don't have docstrings like Python, but they do have standard
ways of documenting modules and functions.
For example,
[this section of a Bash style guide about comments](https://google.github.io/styleguide/shellguide.html#comments)
shows how to follow best practices for documenting Bash code (i.e., the
equivalent of docstrings in Python).
Similarly,
[roxygen2](https://roxygen2.r-lib.org/)
provides a way to follow documentation best practices for R code.


# Project ideas

Previous class projects have been very diverse,
from biology-themed games to large genomic pipelines.

## Pipelines are popular

Pipelines for processing and analyzing genomic data are probably the most
common student project.
Here are some things to keep in mind if you want to do a pipeline project:

-   A set of simple shell scripts that run the steps of a pipeline is not
    enough scripting to qualify as a class project
    (e.g., a set of simple shell scripts for submitting steps of a pipeline to
    the queueing system of an HPC cluster is not enough for a scripting
    project).
    A collection of short shell scripts will not allow you to apply the skills
    and best practices you are learning in class.

-   What can you do to make your pipeline an appropriate class project?
    
    -   Look for opportunities where scripts can make your pipeline more
        automated, reproducible, and generalizable (more reusable).

    -   Look for opportunities where scripts can be useful for preprocessing
        input files, summarizing the content of intermediate files, or
        postprocessing output files.

        -   E.g., one common weakness of large genomic pipelines is that we
            often "fly blind" by running a bunch of steps on our data without
            knowing if, along the way, our data remain biologically meaningful.
            Are there some critical check points in the pipeline, where a
            script that summarizes the state of the data could be informative?

    -   It's fine if your project ends up being one or a few "helper" scripts
        that augment a larger pipeline.

-   Try to make your scripts flexible and general, so you and others can reuse
    them in the future for other, similar pipelines.


# Logistics

Your team will work together to develop your project using a Git repository.
All members of the team should be contributing to the Git repo.
You can set the GitHub repo for your project to be private or public.

You will use this one repository to submit a proposal for your project early in
the semester, and to develop your project throughout the semester.


## Submitting the proposal for your project

Initially, the `README.md` file in your repository only needs to contain a
proposal of your project idea.
This proposal can be brief, describing the project you would like to do
for the class at a high-level;
there's no need to get into fine details for the proposal.

Once your team has prepared the proposal, make sure it is pushed to GitHub and
add me (joaks1) as a collaborator to the GitHub repo.
Early in the semester, you will submit the URL to your GitHub repo with the
proposal via Canvas.


## Use the same repo to develop your project

To develop your project, your team will use the same repo in which you wrote
your proposal.
There is no need to keep your proposal in your `README.md` file;
your original proposal will be preserved in the git history of your repo.
However, you might find that your proposal is a useful starting point for the
external documentation and tutorial for your project.


## Use Git early and often!

Git is your friend; use it early and often.
Commit your progress on your project often and push it to your remote copy of
the repo on GitHub.
This is a great way to practice your Git skills, back up your work, and
be a good team member.
Committing often also allows you to easily go back to previous versions if you
mess something up along the way.
