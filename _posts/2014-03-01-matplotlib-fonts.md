---
layout: post
title: Avoiding Type 3 fonts in matplotlib plots
excerpt: "Controlling fonts in matplotlib plots."
author: jamie_oaks
tags: [computing, python]
comments: true
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

I recently had an annoying experience uploading a manuscript to [ScholarOne's][1] Manuscript Central. I learned the hard way that Manuscript Central does not support Type 3 PostScript fonts in PDF documents, *and* the [Python][2] plotting library, [`matplotlib`][3], uses Type 3 fonts by default.

So, I had to figure out how to make [`matplotlib`][3] not use Type 3 fonts in PostScript and PDF outputs. I was surprised to find very little information on the interweb about how to do this.

I finally stumbled across an [example `matplotlibrc`][4], and after some searching found two key settings: `pdf.fonttype` and `ps.fonttype`. You have to change these settings from the default of `3` to the alternative `42`. You can do this in your `matplotlibrc` file with:


{% highlight python %}
pdf.fonttype : 42
ps.fonttype : 42
{% endhighlight %}
    

Or, you can change these settings in your code using:

{% highlight python %}
import matplotlib
matplotlib.rcParams['pdf.fonttype'] = 42
matplotlib.rcParams['ps.fonttype'] = 42
{% endhighlight %}
    

This causes [`matplotlib`][3] to use Type 42 (a.k.a. TrueType) fonts for PostScript and PDF files. This allows you to avoid Type 3 fonts without limiting yourself to the stone-age technology of Type 1 fonts.

After specifying this setting, I was able to re-run all my plotting scripts, and update my PDFs (there were a lot of them!) to TrueType fonts without any noticeable difference in the images.

In my googleing, I found other folks had used

{% highlight python %}
matplotlib.rcParams['text.usetex'] = True
{% endhighlight %}
    

to force [`matplotlib`][3] to produce Type 1 fonts. However, this caused some of the fonts to look quite different in the plots, and also garbled some of the text where my strings conflicted with TeX syntax.

In general, for fellow [`matplotlib`][3]ers out there, this [example `matplotlibrc`][4] file turns out to be a nice resource for all the ways you can tweak your favorite plotting tool.

 [1]: http://scholarone.com/products/manuscript/
 [2]: http://www.python.org
 [3]: http://matplotlib.org/index.html
 [4]: http://matplotlib.org/users/customizing.html#matplotlibrc-sample
