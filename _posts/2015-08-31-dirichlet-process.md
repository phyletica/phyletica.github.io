---
layout: post
title: The Dirichlet process for dummies (i.e., biologists, like me) 
excerpt: "An accessible introduction to how the Dirichlet process works and why it's useful."
author: jamie_oaks
tags: [statistics]
comments: true
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
  share: dpp-3-share.png
---

The [Dirichlet process](https://en.wikipedia.org/wiki/Dirichlet_process) is a
very useful tool in Bayesian nonparametric statistics, but most treatments of
it are largely impenetrable to a mere biologist with a limited background in
probability theory.
The goal of this post is to provide an accessible introduction to how the
Dirichlet process works and why it's useful.

The Dirichlet process is commonly used in Bayesian statistics in situations
where we suspect there is clustering among random variables, but we do not know
how many clusters there are, nor which random variables belong to which
cluster.
In other words, we want to treat the assignment of the random variables to
clusters as a random variable itself which can be estimated from the data (or
integrated out).
This sounds complicated, but the beauty of Dirichlet processes is simplicity.

To see this simplicity, let's drop some jargon, and just think about assigning
things (I'll call these things "elements") to categories.
By doing so, we are ignoring the "base distribution" bit of the Dirichlet
process; this will allow us to gain intuition about what the Dirichlet process
is and how it can be used to determine the probability of all possible
clusterings (i.e., set partitions) of elements to categories.

The idea of the Dirichlet process is simple; we assign elements to categories
following a very simple rule:
When assigning the $$n^{th}$$ element, we assign it to a new category with the
probability

$$
\frac{\alpha}{\alpha + n -1}
$$

or we assign it to an already existing category $$x$$ with probability

$$
\frac{n_x}{\alpha + n -1}
$$

where $$n_x$$ is the number of random variables already assigned to category
$$x$$.
What's $$\alpha$$?
It's the concentration parameter that controls the "clumpiness" of the
Dirichlet process; it can be any positive real number.
Repeat this rule for all elements, and that's it!

Ok, that might not sound super simple, so let's work through an example.
Let's imagine that we want to assign three elements, $$A$$, $$B$$, and $$C$$,
to an unknown number of categories according to the Dirichlet process.
In this case, there could be 1, 2, or 3 categories, and 5 possible assignments
(partitions):
$$ABC$$, $$A|BC$$, $$B|AC$$, $$C|AB$$, and $$A|B|C$$.
We start with Element $$A$$, for which our only option is to assign it to its
very own, shiny, new category, which we'll call the "blue" category.
This happens with a probability of 1, because we have to put $$A$$ somewhere!
Next, let's figure out what to do with Element $$B$$.
We have two options: (1) We can assign $$B$$ to the same "blue" category that
$$A$$ is in, or (2) we can assign it to a new "red" category.
Following the rule of the Dirichlet process, we assign $$B$$ to a new "red"
category with probability $$\alpha/(\alpha+1)$$, or to the existing "blue"
category with probability $$1/(\alpha+1)$$ (the numerator 1 is simply the
number of things in the "blue" category).
To continue our example, let's say we draw a random number, and $$B$$ gets
assigned to the "blue" category, along with $$A$$.
Next, we need to assign $$C$$.
We can assign it to either a new category with probability
$$\alpha/(\alpha+2)$$, or to the "blue" category, along with $$A$$ and $$B$$,
with probability $$2/(\alpha+2)$$ (the numerator is now 2, because there are
two elements in blue).
If we had more elements, we would continue this logic until they
were all assigned to categories; very simple!

We can draw out all possible assignments as a probability tree, which allows us
to see how the simple rule of the Dirichlet process determines the probability
of all possible assignments. Below is an animation that does just that.

<video width="320" height="240" controls>
    <source src="https://raw.githubusercontent.com/joaks1/dirichlet-process-trees/master/images/dpp-3-example.mp4" type="video/mp4">
    <source src="https://raw.githubusercontent.com/joaks1/dirichlet-process-trees/master/images/dpp-3-example.ogg" type="video/ogg">
    Your browser does not support this video.
</video>
<figcaption>
    <p class="figure-caption-box">
        <span class="center-if-single-line">
            Animation of a Dirichlet-process probability tree.
        </span>
    </p>
</figcaption>

The video walks through all the possible assignments of $$A$$, $$B$$, and $$C$$
assuming a concentration parameter of 0.1. It then updates all the
probabilities for $$\alpha$$ values of 1.5, and finally 50.0.
Notice that as the concentration parameter increases, the probability of more
clustered assignments (i.e., fewer categories) decreases, while the probability
of less clustered assignments (i.e., more categories) increases.
This is the opposite of what you might expect, given it's called the
"concentration" parameter!
But, if you remember that the concentration parameter is in the numerator for
the probability of assigning an element to a new category, you can intuit that
as $$\alpha$$ increases, you'll tend to get more categories.

To gain a better feel for how the Dirichlet process works, and how the 
concentration parameter controls it, check out the larger, interactive
example here:

<div markdown="0" ><a class="btn btn-info" href="{{ site.baseurl }}/dpp-demo/">Click here for a DPP demo!</a></div>

The example shows the probability tree for 4 elements, and allows you to tinker
with the concentration parameter and observe the effect on partition
probabilities.
By studying the animation and interactive demo, you might notice that the
elements, despite not being independent, are
[exchangeable](https://en.wikipedia.org/wiki/Exchangeable_random_variables)
(i.e., the probability of the assignment does not depend on the identity of the
elements).

Above, we've ignored the bit about the Dirichlet process called the *base
distribution*.
However, that is not too complicated either.
To incorporate the base distribution, all we need to do is think of the
"categories" above as a particular random value drawn from a distribution.
I.e., all the random variables in a category share the same value, and the
values are distributed according to our chosen base distribution.

Why is this useful?
Well, let's say we are trying to model the rate of mutation for thousands
of genes across the genome.
The most general model assigns each gene its own independent mutation-rate
parameter.
The simplest model assumes all the genes share the same mutation rate.
We might suspect that reality is somewhere in between these extremes, but *a
priori* we have no information about how many free mutation-rate parameters
there should be, or how the genes should be assigned to the rates.
The Dirichlet process gives us a mathematically convenient and flexible way to
assign prior probabilities to all possible models (i.e., all possible
assignments of genes to rate parameters).
Also, when coupled with a [Gibbs
sampler](https://en.wikipedia.org/wiki/Gibbs_sampling), the Dirichlet process
provides a computationally efficient way of sampling from the posterior
distribution over all these possible models.
Thus, we can make inferences about gene evolution while integrating out
uncertainty about how rates of mutation are distributed across the genes.
Cool!

