---
layout: page
title: Software
excerpt: "Software packages."
author: phyletica 
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

Most of my packages, scripts, and other projects are freely available on [GitHub][1]. Below are descriptions of a few.

## [dpp-msbayes][3]

[dpp-msbayes][3] is a modified version of a popular comparative phylogeographical method for estimating shared evolutionary history in an approximate-Bayesian framework. This version is reparameterized and uses more flexible priors, most notably a Dirichlet-process prior over shared histories. The modifications increase the method's power for detecting temporal variation in divergences across taxa, allowing for more robust inference that more accurately reflects uncertainty. If you are interested in using this method, it is probably easier (and faster) to use it (and its predecessor) using the Python package [PyMsBayes][4] (see below).

## [PyMsBayes][4]

[PyMsBayes][4] is a multi-processing Python API for approximate Bayesian computation (ABC), and provides a multi-processing interface to the comparative phylogeographic software packages, msBayes and [dpp-msbayes][3].

## [ABACUS][5]

[ABACUS][5] (Approximate BAyesian C UtilitieS) is a collection of C utilities for approximate Bayesian computation (ABC). One of the tools distributed with [ABACUS][5] is euReject, a program for performing rejection sampling of ABC posteriors.

## [SeqSift][6]

[SeqSift][6] is a python package for downloading, vetting, manipulating, and converting molecular sequence data. It also allows for *in silico* restriction digests.

## [SATé][2]

I am a developer for the software pacakge [SATé][2]. [SATé][2] is a tool for inferring a sequence alignment and phylogenetic tree using an iterative algorithm. In each iteration, the data set is divided into smaller subproblems by a tree-based decomposition, which are subsequently aligned before being merged back together for phylogenetic tree inference.


 [1]: https://github.com/joaks1
 [2]: http://phylo.bio.ku.edu/software/sate/sate.html
 [3]: https://github.com/joaks1/dpp-msbayes
 [4]: https://github.com/joaks1/PyMsBayes
 [5]: https://github.com/joaks1/abacus
 [6]: https://github.com/joaks1/SeqSift
