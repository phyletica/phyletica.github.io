---
layout: post
title: DPP 
excerpt: "DPP fun."
author: jamie_oaks
tags: [statistics]
comments: true
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

The Dirichlet process is commonly used in Bayesian statistics in situations
where we suspect there is clustering among random variables, but we do not know
how many clusters there are, nor which random variables belong to which
clusters.
In other words, we want to treat the assignment of the random variables to
clusters, and the number of clusters, as a random variable itself which can be
estimated from the data (or integrated out).
This sounds complicated, but the beauty of Dirichlet process is its
simplicity.

To ...
Let's replace the assignment of random variables to an unknown number of
clusters with the analogy of Instead, let's just think about assigning things
(I'll call these things "elements") to categories.
By ignoring the "base distribution" bit of the Dirichlet process, we can easily
gain intuition of how the Dirichlet process can be used to determine the
probability of all possible clusterings (i.e., set partitions) of elements to
categories.

The idea of the Dirichlet process is simple; we assign elements to categories
following a very simple rule.
When assigning the $$n^{th}$$ element, we assign it to its own category (i.e.,
a new category) with the probability

$$
\frac{\alpha}{\alpha + n -1}
$$

or you assign it to an already existing category $$x$$ with probability

$$
\frac{n_x}{\alpha + n -1}
$$

where $$n_x$$ is the number of random variables already assigned to category
$$x$$.
What's $$\alpha$$?
It's the concentration parameter that controls the "clumpiness" of the
Dirichlet process; it can be any positive real number.
Repeat for all elements, and that's it!

Ok, that might not sound simple, so let's work through an example.  Let's
imagine that we need to assign three elements, A, B, and C, to an unknown
number of categories.
We will start with Element A, and we have no other option to assign it to its
very own, new, shiny category, which we'll call the "blue" category. This
happens with a probability of 1, because we had to put A somewhere!
Next, let's figure out what to do with Element B.
Well, we have two options. We can assign it to the same "blue" category that A
is in, or we can assign it to a new "red" category.
Following the rule of the Dirichlet process, we assign B to the new "red"
category with probability $$\alpha/(\alpha+1)$$, or to the existing "blue"
category with probability $$1/(\alpha+1)$$ (the numerator 1 is simply the
number of things in the "blue" category).
To continue our example, let's say we draw a random number, and Element B gets
assigned to the "blue" category, along with A.
Next, we need to assign C.
We can assign it to either its own, new category with probability
$$\alpha/(\alpha+2)$$, or to the "blue" category, along with A and B, with
probability $$2/(\alpha+2)$$ (the numerator is now 2, because there are two
elements in blue).

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

The video walks through all the possible assignments of A, B, and C assuming a
concentration parameter of 0.1. It then updates all the probabilities for
$$\alpha$$ values of 1.5, and finally 50.0.
Notice that as the concentration parameter increases, the probability of more
clustered assignments (i.e., fewer categories) decreases, while the probability
of less clustered assignments (i.e., more categories) increases.
The opposite of what you might expect, given it's called the "concentration"
parameter!
But, if you just remember that the concentration parameter is in the numerator
for the probability of assigning an element to a new category, you can intuit
that as $$\alpha$$ increases, you'll tend to get more categories.

To gain a better feel for how the Dirichlet process works, and how the 
concentration parameter controls it, check out the larger, interactive
example here:

<div markdown="0" ><a class="btn btn-info" href="{{ site.baseurl }}/dpp-demo/">Click here for a DPP demo!</a></div>

By studying the animation and interactive demo, you might also notice that the
elements, despite not being independent, are
[exchangeable](https://en.wikipedia.org/wiki/Exchangeable_random_variables)
(i.e., the probability of the assignment does not depend on the identity of the
elements).
