---
layout: post
title: Imagemagick stuff
excerpt: "Imagemagick stuff."
author: jamie_oaks
tags: [computing]
comments: true
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
  thumb: phyletica-avatar.png
published: false
---

{% highlight bash %}
mkdir imagemagick-play
cd imagemagick-play
{% endhighlight %}

{% highlight bash %}
curl -o slides.pdf http://phyletica.org/downloads/dpp-3-slides.pdf
{% endhighlight %}


{% highlight bash %}
convert -density 600 slides.pdf -strip -resize @1048576 PNG8:slide-%02d.png
{% endhighlight %}

resize is based on 1024x1024, but imagemagick will maintain aspect ratio.

{% highlight bash %}
convert -layers OptimizePlus -delay 75 slide-0?.png slide-1[01234].png -delay 300 slide-1[567].png -loop 0 slides.gif
{% endhighlight %}

{% highlight bash %}
convert -layers OptimizePlus -delay 75 slide-0?.png slide-1[01234].png -delay 300 slide-1[567].png slides.mp4
{% endhighlight %}

{% highlight bash %}
rm slide-??.png
{% endhighlight %}

I think imagemagick uses ffmpeg in the background to make the video (so it will need to be installed).
You can also use ffmpeg directly: 

{% highlight bash %}
ffmpeg -f gif -i slides.gif slides.mp4
{% endhighlight %}

The video...

<video width="320" height="240" controls>
    <source src="https://raw.githubusercontent.com/joaks1/dirichlet-process-trees/master/images/dpp-3-example.mp4" type="video/mp4">
    <source src="https://raw.githubusercontent.com/joaks1/dirichlet-process-trees/master/images/dpp-3-example.ogg" type="video/ogg">
    Your browser does not support this video.
</video>

{% highlight bash %}
curl -o blue-triangle.png http://phyletica.org/images/play-blue.png
{% endhighlight %}

[here](http://www.imagemagick.org/Usage/blur/#shadow)
{% highlight bash %}
convert blue-triangle.png \( +clone -background black -shadow 80x3+0+8 \) +swap -background none -layers merge +repage play-button.png
{% endhighlight %}


{% highlight bash %}
tmpdir="$(mktemp -d)"
convert -coalesce slides.gif "$tmpdir/temp-frame-%06d.png"
convert "$tmpdir/temp-frame-000000.png" play-button.png -gravity center -composite play-slide.png
rm -r "$tmpdir"
{% endhighlight %}

[here](http://codepen.io/CalebGrove/pen/bIsqy)
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

The hover gif...

<figure>
    <a href="/images/dpp-3-example.png"><img class="gif-hover" src="/images/dpp-3-example.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Dirichlet process example.
            </span>
        </p>
    </figcaption>
</figure>

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

The clickable gif...

<figure>
    <img class="gif-click" src="/images/dpp-3-example.png">
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Dirichlet process example.
            </span>
        </p>
    </figcaption>
</figure>


