---
layout: post
title: Converting PDF slides to animated GIFs and videos with ImageMagick
excerpt: "The power and flexiblity of Imagemagick command-line tools is ... magickal."
author: jamie_oaks
tags: [computing]
comments: true
image:
  feature: header-koh-rong-samloem.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
  thumb: phyletica-avatar.png
---

The power and flexibility of the
[ImageMagick](http://www.imagemagick.org/script/index.php) suite of software
never fails to amaze me.
Not only does
[ImageMagick](http://www.imagemagick.org/script/index.php)
provide several command-line tools capable of meeting all your image
editing/conversion needs, there are also APIs for over a dozen languages,
including Python, Ruby, and Perl.
I should preface this post by declaring that I am not an expert on the use of
[ImageMagick](http://www.imagemagick.org/script/index.php), but I have used it
successfully to script solutions for many of my image-editing needs.
One recent task for which it spared me from having to resort to using a
GUI-based image editor was converting a series of PDF slides into an animation
for one of my [recent posts]({{ site.baseurl }}/dirichlet-process/).
I wanted to document how I did this for my own memory, and in case someone else
might find it useful.

If you want to follow along, create a directory and download the PDF slides:

{% highlight bash %}
mkdir fun-with-im
cd fun-with-im
curl -o slides.pdf http://phyletica.org/downloads/dpp-3-slides.pdf
{% endhighlight %}

My first step was to use the `convert` tool to convert the slides into separate
PNG files:

{% highlight bash %}
convert -density 600 slides.pdf -strip -resize @1048576 PNG8:slide-%02d.png
{% endhighlight %}

The `-density` option determines the resolution (in dots per inch) at which
to rasterize the PDF.
The `-strip` option removes any comments or profiles from the output images; I
use this option a lot to reduce the file size of images for the web.
The `-resize` option determines the size of the output PNG.
This option is very flexible in [the arguments it can
handle](http://www.imagemagick.org/script/command-line-processing.php#geometry);
here I use the `@` symbol to specify the area in pixels
([ImageMagick](http://www.imagemagick.org/script/index.php) will preserve the
aspect ratio).
To further reduce file size, I specified 8-bit PNG files using the `PNG8:`
syntax.
Lastly, the `slide-%02d.png` syntax in the output file name specifies that I
want the slides to be named `slide-00.png`, `slide-01.png`, `slide-02.png`,
etc.

Next, we can convert the PNGs into an animated GIF:

{% highlight bash %}
convert -layers OptimizePlus -delay 75 slide-0?.png slide-1[01234].png -delay 300 slide-1[567].png -loop 0 slides.gif
{% endhighlight %}

I have no idea how the `-layers OptimizePlus` option works, but it optimizes
the final output to reduce the animated file size.
The `-delay` option specifies the number of ticks (the default rate is 100
ticks per second) to pause each image.
The options in the command above specify to spend 3/4 of a second on the first
15 slides, and then 3 seconds on the last three slides.
The `-loop` option specifies the number of times the GIF animation should
repeat;
setting it to zero will cause the GIF to repeat indefinitely.

We can use the same command (minus the `loop` option) to create a movie out of
the PNG images:

{% highlight bash %}
convert -layers OptimizePlus -delay 75 slide-0?.png slide-1[01234].png -delay 300 slide-1[567].png slides.mp4
{% endhighlight %}
 
Here, we specified an MP4, but other output formats are supported.
I think [ImageMagick](http://www.imagemagick.org/script/index.php) uses
[ffmpeg](https://www.ffmpeg.org/) in the background to make the video, so you
might have to install it.
You can also use [ffmpeg](https://www.ffmpeg.org/) directly: 

{% highlight bash %}
ffmpeg -f gif -i slides.gif slides.mp4
{% endhighlight %}

Either way, you should end up with a video like the following:

**NOTE:** The video is not displaying for some OS/browser combinations.
If it's not working for you, check out the animated GIF below.
{: .notice}

<video width="320" height="240" controls>
    <source src="/images/dpp-3-example.mp4" type="video/mp4">
    <source src="/images/dpp-3-example.ogg" type="video/ogg">
    <source src="/images/dpp-3-example.mov">
    Your browser does not support this video.
</video>
<figcaption>
    <p class="figure-caption-box">
        <span class="center-if-single-line">
            The slides animated as a video.
        </span>
    </p>
</figcaption>

Pretty slick; with just a few simple command lines, we went from a PDF to an
animated GIF and movie.
Ok, let's clean up all those intermediate PNGs:

{% highlight bash %}
rm slide-??.png
{% endhighlight %}

Next, we can make a faux play-button image, which, when used with a little
javascript, will make the GIF appear controllable.
To make the "play button," we'll start with a simple blue triangle, which you
can download:

{% highlight bash %}
curl -o blue-triangle.png http://phyletica.org/images/play-blue.png
{% endhighlight %}

We can use `convert` to add a shadow to the triangle to make it stand out a bit:

{% highlight bash %}
convert blue-triangle.png \( +clone -background black -shadow 80x3+0+8 \) +swap -background none -layers merge +repage play-button.png
{% endhighlight %}

This command was taken, almost verbatim, from [the fantastic ImageMagick
documentation](http://www.imagemagick.org/Usage/blur/#shadow).

Next, we will parse the GIF frames into individual PNG files in order to
overlay the play button onto the first frame.

{% highlight bash %}
convert -coalesce slides.gif frame-%02d.png
{% endhighlight %}

**NOTE:** I realize we could have avoided this step by simply using the PNG
files we just deleted above, but I often have a GIF as the starting point for
this task, and so I wanted to document how to convert the GIF into separate
frames.
{: .notice}

Next, let's overlay the shadowed play button:

{% highlight bash %}
convert frame-00.png play-button.png -gravity center -composite slides.png
{% endhighlight %}

Now, `slides.png` is the first frame of the GIF and looks like it has a "play"
button on it.
Notice that I named the output "play-button" as `slides.png` such that the
prefix matches the `slides.gif` file we made above.
That was intentional, because now we can use some javascript sleight-of-hand to
make the GIF appear controllable on the web.
Here's the javascript magic that I found on
[codepen](http://codepen.io/CalebGrove/pen/bIsqy):

{% highlight javascript %}
$(document).ready(function() {
    $(".gif-hover").hover(
        function() {
            var src = $(this).attr("src");
            $(this).attr("src", src.replace(/\.png$/i, ".gif"));
        },
        function() {
            var src = $(this).attr("src");
            $(this).attr("src", src.replace(/\.gif$/i, ".png"));
        });
});
{% endhighlight %}

Adding this javascript to our page allows us to use the `gif-hover` class when
embedding the PNG/GIF as an image:

{% highlight html %}
<img class="gif-hover" src="dpp-3-example.png"></a>
{% endhighlight %}

The result is the following GIF that will "play" when moused over.

<figure>
    <img class="gif-hover" src="/images/dpp-3-example.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                A GIF that will "play" when hovered over.
            </span>
        </p>
    </figcaption>
</figure>

If we prefer to "control" the GIF with mouse clicks, we can modify the
javascript a bit:

{% highlight javascript %}
$(document).ready(function() {
    function swap_to_gif() {
        var src = $(this).attr("src");
        $(this).attr("src", src.replace(/\.png$/i, ".gif"));
        $(this).one("click", swap_to_png);
    }
    function swap_to_png() {
        var src = $(this).attr("src");
        $(this).attr("src", src.replace(/\.gif$/i, ".png"));
        $(this).one("click", swap_to_gif);
    }
    $(".gif-click").one("click", swap_to_gif);
});
{% endhighlight %}

Now, we can use the `gif-click` class for the image:

{% highlight html %}
<img class="gif-click" src="dpp-3-example.png">
{% endhighlight %}

The result is the following GIF that will start/stop with mouse clicks.

<figure>
    <img class="gif-click" src="/images/dpp-3-example.png">
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                A GIF that will "play/stop" when clicked.
            </span>
        </p>
    </figcaption>
</figure>

Notice, the javascript functions work by simply changing the path from the
"play-button" PNG file to the GIF, and vice versa.
For this to work, the files need to be in the same directory and share the same
prefix.
A little hacky, no doubt, but it works.

