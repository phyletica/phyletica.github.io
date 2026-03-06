---
layout: page
title: Code review assignment
excerpt: "Reviewing code from the primary literature"
author: phyletica
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

{% include _toc.html %}


# The goal

As a scientist, you will be asked to peer-review research manuscripts and
associated code to assess the quality and reproducibility of the research and
the authors' interpretations of the results.
To help develop this skill, and to practice applying the coding concepts we learn
in class, you will choose a manuscript from the primary literature that
utilized a significant scripting component to simulate, process, or analyze
their data.


# Getting in the mindset for your code review

Imagine an editor of a journal has asked you to review the article, but she
wants you to focus your review on the associated code.
As a reviewer, your goal is to provide a constructive critique of the authors'
code to help them improve it.

You will write a review of the article, focused on the associated code and your
ability to reproduce the results presented in the published manuscript.
Fully reproducing the results may not be feasible, but you should still discuss
whether the authors provided what is necessary to do so (and if not, what was
missing?).


# Focus on helping the authors improve their code

Peer review is best when it is constructive.
Our job as peer reviewers is to help the authors improve their work.


# Choosing the paper and code to review

The code associated with the paper you choose to review can range from a
relatively small script to a large code base with hundreds of files of code.
I encourage you to select a paper/code base for which your review will benefit
you beyond this class.
For example, you might pick a piece of software that you need to understand and
use for your research.
Of course, if you prefer to pick a paper and code that you think is interesting
and cool, that is fine too.

The paper you select should be the one that originally introduces the code you
will review (i.e., not a subsequent paper that uses the code).


# Does the code need to be in Python

No.
You are welcome to review code in other languages.
There are enough similarities across languages that you can review code in a
language you are not familiar with.
For example, are the authors using expressive coding (e.g., descriptive names
for variables, functions, and classes) and documenting the code in a consistent
and detailed way?
You can evaluate these things even if you don't code in the language.

That said, I recommend that you choose a modern scripting language
(e.g., python, perl, ruby, julia, bash, R).
Compiled languages like C and C++ will be more difficult to read and
understand.
That said, this is not a hard requirement.


# Use your inexperience to your advantage!

Many of you are new to coding and might feel you lack the experience to provide
meaningful feedback on code written by more experienced programmers.
That is not true!
Most of the people that use the authors' code are just like you!
Anything you find difficult or confusing about obtaining, installing, using, or
reading the code, other scientists will too.
What could the authors potentially do differently to make their code more
accessible to scientists like you?


# Do you need to read and understand all the code?

No.
You do not need to read or understand every line of code for a code review.
Instead, you can sample different parts of the code to get a sense of whether
the authors are using the best practices you are learning in class, and, if
not, what can they do to improve their code.


# Structuring your review

1.  Provide a brief summary of the paper.
    Remember your audience: The editor and the authors.
    They are already familiar with the paper, so your introductory synopsis
    should be brief.
    Toward the end of the summary, you can state something like, "As requested
    by the editor, my review below focuses on the code associated with this
    manuscript."
    
    For a real review, you would often end this introductory synopsis with your
    overall recommendation (e.g., accept with minor revisions, accept with
    major revisions, reject with resubmission encouraged, reject).
    However, given the paper you're reviewing is already published, you don't
    need to do this.

2.  Next, highlight your most important, high-level suggestions to help improve
    the authors' code.
    This section should focus on broader feedback in reference to the overall
    code base and documentation.
    You can number or bullet this section, if you wish.

3.  Next, you can focus on more specific, lower-level feedback.
    For example, specific changes/corrections to the code or documentation.
    This section can be a bulleted list.


# Things to think about and potentially address in your review

Note, all of the items below might not be relevant for the specific code base
you are reviewing.

-   How easy was it for you to obtain, install, and run the code?
    -   If you ran into road blocks, what were they, and what could the authors
        do differently to make their code easier to use?
-   Do the authors provide good documentation, both inside and outside (e.g.,
    README files) of their code?
-   Do the authors provide information about how to reproduce the results in
    their paper?
-   Do the authors provide or specify a way to create a computational
    environment with all the requirements in place for their code to work?
-   Do the authors provide examples/tutorials for how to use their software?
-   Is the code modular. I.e., is it broken up into into functions and/or class
    methods? Long sections of code is often a sign of poor coding practices.


# Logistics

You will write your code review in a markdown-formatted `README.md` file and
version-control it with Git.

Each student should write their own review in their own Git repository.


## Proposing the paper/code you want to review

Initially, the `README.md` file only needs a very brief proposal of the paper
and code you would like to review (ideally with links to the paper and code
base).
Once you have this committed to your repo.
Push your repo to GitHub (you can make your GitHub repo private or public),
add me (joaks1) as a collaborator to the repo on GitHub,
and submit the URL of your GitHub repo via Canvas.


## Use the same repo to write your review

To write your review, use the same repo and `README.md` you used to submit your
proposal.
There is no need to keep your proposal, you can overwrite it.
It will be preserved in the git history of your repo.


## Use Git early and often!

Git is your friend; use it early and often.
Commit your progress on your review often and push it to your remote copy of
the repo on GitHub.
This is a great way to practice your Git skills and back up your work.
Committing often also allows you to easily go back to a previous version if you
mess something up along the way.
