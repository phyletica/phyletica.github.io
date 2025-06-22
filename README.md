# Phyletica Lab Website

This is the jekyll-enabled website for the Phyletica Lab:

[phyletica.org](http://phyletica.org).


# How to build the website from source files

First, navigate to the `phyletica.github.io` repo and make sure you are on the
`jekyll-site-src` branch:

    git checkout jekyll-site-src

## Setting up ruby environment

First, use `conda` (or `mamba`) to create the `phyletica` ruby environment:

    conda env create -f conda-environment.yml

Then activate the `phyletica` environment:

    conda activate phyletica

Next, install `bundler` (or update it):

    gem install bundler -v 2.4.22

Next, make sure your are in the `phyletica.github.io` repo, and install
required ruby gems (including jekyll) via:

    bundle install

Now, you should be able to build and serve the static HTML with:

    bundle exec jekyll serve

If you want the build to update as you modify the source files you can add the
`--incremental` flag:

    bundle exec jekyll serve --incremental

If you get the error "invalid byte sequence in US-ASCII", this seems to fix it:

    export LC_CTYPE="en_US.UTF-8"
    export LANG="en_US.UTF-8"
