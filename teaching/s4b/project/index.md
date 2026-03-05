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
| External documentation | 30% |
| Presentation | 30% |


# Scripting languages

You are welcome to use any scripting language for your project.
However, you are expected to apply the skills and best practices you learn in
class to whatever language you use for the project.
All the best practices we learn in *Scripting for Biologists* using Python are
transferable to other scripting languages.

Some examples of those best practices include keeping your code modular so that
it is easier to understand and more reusable, making your code expressive
(e.g., using informative variable names), and writing good documentation within
your code.
Most languages don't have docstrings like Python, but they do have standard
ways of documenting your modules and functions.
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

Pipelines for genomic data are probably the most common student project.
Here are some things to keep in mind if you want to do a pipeline project:

-   A set of simple shell scripts that run the steps of a pipeline is not
    enough scripting to qualify as a class project
    (e.g., a set of simple shell scripts for submitting steps of a pipeline to
    the queueing system of an HPC cluster is not enough for a scripting
    project).
    A collection of short shell scripts will now allow you to apply the skills
    and best practices you are learning in class.

-   What can you do to make your pipeline an appropriate class project?
    
    -   Look for opportunities where scripts can make your pipeline more
        automated, reproducible, and generalizable (more reusable).

    -   Look for opportunities where scripts can be useful for preprocessing
        input files, summarizing the content of intermediate files, or
        postprocessing output files.

        -   E.g., one common weakness of large genomic pipelines is that we
            often "fly blind" by running a bunch of steps on our data without
            knowing if our data along the way remains biologically meaningful.
            Are there some critical check points in the pipeline, where a
            script that summarizes the state of the data could be informative?

    -   It's fine if your project ends up being one or a few "helper" scripts
        that augment a larger pipeline.

-   Try to make your scripts flexible/general, so you and others can reuse them
    in the future for other, similar pipelines.


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

To develop your project, your team will use the same repo you used to submit
your proposal.
There is no need to keep your proposal, but, you might find it useful as a
starting point for the external documentation and tutorial for your project.
Your original proposal will be preserved in the git history of your repo.


## Use Git early and often!

Git is your friend; use it early and often.
Commit your progress on your project often and push it to your remote copy of
the repo on GitHub.
This is a great way to practice your Git skills, back up your work, and
be a good team member.
Committing often also allows you to easily go back to previous versions if you
mess something up along the way.
