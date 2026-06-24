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

Next, install gcc, gxx, and an older version of sysroot. We can't include these
in the conda YAML file, because they create dependency conflicts.

    conda install -c conda-forge gcc_linux-64 gxx_linux-64 sysroot_linux-64=2.17
    conda deactivate
    conda activate phyletica

Note, the conda install will upgrade the version of binutils, but this isn't a
problem.

Next, install `bundler` (or update it):

    gem install bundler -v 2.1.4

We need to install eventmachine, which is a huge pain. Before we try installing
eventmachine, we need to make sure cc/cxx references point to conda compilers
in the ruby config:

    sed -i 's|CC=gcc|CC=x86_64-conda-linux-gnu-cc|g' "${CONDA_PREFIX}/lib/ruby/2.4.0/x86_64-linux/rbconfig.rb"
    sed -i 's|\"gcc\"|\"x86_64-conda-linux-gnu-cc\"|g' "${CONDA_PREFIX}/lib/ruby/2.4.0/x86_64-linux/rbconfig.rb"
    sed -i 's|CXX=g++|CXX=x86_64-conda-linux-gnu-c++|g' "${CONDA_PREFIX}/lib/ruby/2.4.0/x86_64-linux/rbconfig.rb"
    sed -i 's|\"g++\"|\"x86_64-conda-linux-gnu-c++\"|g' "${CONDA_PREFIX}/lib/ruby/2.4.0/x86_64-linux/rbconfig.rb"

These sed commands should make sure that the following values are set in `rbconfig.rb`:

-   CONFIG["configure_args"] should include 'CC=x86_64-conda-linux-gnu-cc' and 'CXX=x86_64-conda-linux-gnu-c++'
-   CONFIG["CC"] = "x86_64-conda-linux-gnu-cc"
-   CONFIG["CXX"] = "x86_64-conda-linux-gnu-c++"

Next, install `eventmachine` (or update it):

    gem install eventmachine -v 1.0.4 -- --with-opt-dir="$CONDA_PREFIX" --with-openssl-dir="$CONDA_PREFIX"

Next, we need to install the remaining required ruby gems with `bundle
install`. However, there are several gems that fail to compile with modern
versions of GCC (14+), so we need to compile and install them while turning off
the 'incompatible-pointer-types' error. We can do this while running bundle
install

    CFLAGS="-Wno-error=incompatible-pointer-types" bundle install

Note, make sure you are in the base directory of the 'phyletica.github.io'
repo, because `bundle-install` needs the Gemfile.

If that doesn't work, we can install the problematic gems manually before calling bundle install:

    gem install http_parser.rb -v '0.6.0' -- --with-cflags="-Wno-error=incompatible-pointer-types"
    gem install ffi -v '1.13.1' -- --with-cflags="-Wno-error=incompatible-pointer-types"
    gem install redcarpet -v '3.5.0' -- --with-cflags="-Wno-error=incompatible-pointer-types"
    bundle install

Now, (FINALLY!!) you should be able to build and serve the static HTML with:

    bundle exec jekyll serve

If you want the build to update as you modify the source files you can add the
`--incremental` flag:

    bundle exec jekyll serve --incremental

If you get the error "invalid byte sequence in US-ASCII", this seems to fix it:

    export LC_CTYPE="en_US.UTF-8"
    export LANG="en_US.UTF-8"
