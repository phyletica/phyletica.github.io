---
layout: post
title: Getting image of TeX equation from the command line
excerpt: "A useful trick for generating pretty equations from the prompt."
author: jamie_oaks
tags: [computing]
comments: true
image:
  feature: header-bukit-larut-hq.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
  thumb: phyletica-avatar.png
---

<figure>
    <a href="/images/selection.png"><img src="/images/selection.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Change in the frequency of an allele in one generation.
            </span>
        </p>
    </figcaption>
</figure>

As much as we love working in \*TeX, we inevitably get stuck working
in MS Office or Google Docs and have no way of making nice equations.
This happened to me last fall while teaching Evolution using mostly Google
Slides.
Early in the semester, I found a very slick trick for quickly generating image
files from TeX equations.
The trick was explained in a brilliant answer by
[Peter Grill](https://tex.stackexchange.com/users/4301/peter-grill)
on StackExchange
([see here](https://tex.stackexchange.com/questions/34054/tex-to-image-over-command-line/34058#34058)).

The trick is based on a small, simple LaTeX document:

~~~ latex
\ifdefined\formula
\else
    \def\formula{E = m c^2}
\fi
\documentclass[border=2pt]{standalone}
\usepackage{amsmath}
\usepackage{varwidth}
\begin{document}
\begin{varwidth}{\linewidth}
\[ \formula \]
\end{varwidth}
\end{document}
~~~

The `standalone` class and `varwidth` environment ensure the final image will
not have unnecessary white space around your equation (see
[Peter Grill's post](https://tex.stackexchange.com/questions/34054/tex-to-image-over-command-line/34058#34058)
for more details).

I saved the LaTeX code above to `~/texmf/tex/latex/formula.tex`
and then made sure my TeX distribution could 'see' it by:

~~~ bash
$ cd ~/texmf
$ mktexlsr .
~~~

Depending on your system and TeX distribution, this might be a bit different.

Next, I added the following shell script, which I named `formula`, to my PATH:

~~~ bash
#!/bin/sh

if [ -z "$@" ]
then
    TEX_EQUATION="p' = \frac{p}{1-q^2s}"
else
    TEX_EQUATION="$@"
fi

pdflatex "\def\formula{${TEX_EQUATION}}\input{formula.tex}"

convert -density 300 formula.pdf -quality 90 formula.png
~~~

This could be modified to add some bells and whistles, like arguments to
control the output format and quality, but I kept it simple.

**NOTE:** `convert` is part of
[ImageMagick](http://www.imagemagick.org/script/index.php),
so that is required for this to work.
If you don't already have 
[ImageMagick](http://www.imagemagick.org/script/index.php),
you should go install it right now, because it's awesome, as
I've talked about in
[previous posts]({{ site.baseurl }}/imagemagick/)
{: .notice}

Now, I can simply type

~~~ bash
$ formula "p(\theta|D) = \frac{p(D|\theta) p(\theta)}{\int p(D|\theta)p(\theta)\,d\theta}"
~~~

and get `formula.png` in my current working directory that has a nice looking
rendition of Bayes' rule.

<figure>
    <a href="/images/bayes-rule.png"><img src="/images/bayes-rule.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Bayes' rule.
            </span>
        </p>
    </figcaption>
</figure>
