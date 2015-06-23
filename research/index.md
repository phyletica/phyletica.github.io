---
layout: page
title: Research
excerpt: "Some research details."
author: phyletica 
image:
  feature: header-misty-mangroves.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---

{% include _toc.html %}

In general, we develop phylogenetic methods, collect genomic datasets from
natural populations of co-distributed species, and apply the former to the
latter to better understand historical processes of diversification across
regions characterized by high levels of species richness and endemism.

---

## Implementing a full-likelihood Bayesian model of co-diversification

While the method implemented in dpp-msbayes is more powerful and robust than
its predecessor, both methods are based on approximate likelihoods and discard
information when reducing the genetic data to a set of insufficient summary
statistics.
Thus, dpp-msbayes still struggles to discriminate among models of divergence at
recent evolutionary timescales {% cite Oaks2014dpp %}.
Given that such a statistical tool is integral to the evolutionary questions
I seek to answer in my empirical research,
I am currently developing a method that employs a similar hierarchical model in
a full-likelihood Bayesian framework.
By analytically integrating over gene trees, the method will efficiently handle
NGS datasets.
By utilizing all of the information in the data, the method promises to be much
more powerful than its approximate-Bayesian counterparts, and will also be
applicable at deeper evolutionary timescales.
This new tool will allow evolutionary biologists to better leverage comparative
genomic data to assess the affects of regional and global biogeographical
processes on biodiversity.

---

## Diversification across oceanic and mainland Southeast Asia

In addition to developing a full-likelihood Bayesian framework for inferring
co-diversification, I have also collected genome-wide sequence data from nearly
300 individuals of two genera of geckos (*Cyrtodactylus* and *Gekko*)
from across the Philippine Archipelago using NGS technology.
The combination of the new method and NGS data will allow us to better assess
the affect of sea-level fluctuations on diversification across oceanic islands
of Southeast Asia.

To complement this work on oceanic islands, I am also working with an
international team of collaborators to better understand diversification in
mainland Southeast Asia.
We are collecting a large comparative dataset of reptiles and amphibians from
across much of the Sunda Shelf, and will apply the
methods I am developing to test long-standing hypotheses about the affect of
biogeographical transition zones on the diversification of Sunda Shelf biota,
including the Isthmus of Kras, and current and paleo-river systems.
We plan to seek funding from the NSF Biodiversity Discovery and Analysis
Program for this project.

---

## Diversification of the highly endemic fauna of the Gobi Desert

The Gobi is the largest desert in Asia and is a mosaic of rocky mountain ranges
surrounded by basins of sand dunes.
An international team of collaborators (Jesse Grismer and Dr.\ Rafe Brown of
the University of Kansas, Dr.\ Natalia Ananjeva of the Russian Academy of
Sciences, Dr.\ Xianguang Guo of the Chinese Institute of Biology, and Dr.\
Nyamsuren Batsaikhan of the National University of Mongolia) and I were awarded
a grant from the National Geographic Society to better document and understand
the history of the unique assemblage of reptiles that inhabit this region.
Our goal is to collect genomic data from a set of focal sand and rock-adapted
taxa and use the comparative methods I am developing to
(1) infer their evolutionary origins,
(2) test for patterns of shared evolutionary history, and
(3) identify key processes that led to the diverse and unique fauna of this
region.

---

## Diversification in West-Central African rainforests

I am working with Drs.\ Adam Leach\'{e} and Matthew Fujita to apply the novel
statistical methods described above to comparative NGS datasets
to elucidate the historical processes of diversification and community assembly
across West-Central African rainforests.
We are particularly interested in determining how Pliocene and Pleistocene
aridification cycles and associated rainforest fragmentation influenced
diversification across the Afro-tropics.

---

## Diversification in Southeast Asia

One question we are actively pursuing is whether Quaternary climatic
oscillations promoted diversification by fragmenting the distributions of
species.
An ideal model system for addressing this question is the dynamic landscape of
Southeast Asia.
The Southeast Asian mainland and 26,000+ islands experienced dramatic cyclical
shifts in the extent of the terrestrial landscape during glacial cycles.
Many groups of islands in this region coalesced during lower sea levels of
glacial periods and were fragmented during interglacial rises in sea level.

<figure>
    <a href="/images/sunda-shelf.png"><img style="border:1px solid black" src="/images/sunda-shelf.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Map of Southeast Asia with land extent (depicted in gray)
                during glacial lowstands estimated using 120m bathymetry (data
                from 
                <a href="http://ngdc.noaa.gov/mgg/global/global.html">ETOPO1</a>).
            </span>
        </p>
    </figcaption>
</figure>

### Diversification of geckos

To test whether the repeated formation and fragmentation of island complexes
promoted diversification, we are studying the evolutionary history of two
genera of geckos *Cyrtodactylus* and *Gekko* that are co-distributed across
most of the islands of the Philippines.
We found that populations within island complexes did explain a significant
proportion of genetic diversity, but were not monophyletic, and there was
no obvious pattern of diversification associated with Pleistocene glacial
cycles {% cite Siler2010 %}.
Our results supported complex histories for both genera that contradict many of
the traditional areas of endemism predicted by island connectivity during
glacial periods.
Interestingly, for *Gekko*, we found evidence that the genus colonized the
Philippines by "rafting" on the Palawan Microcontinental Islands that rifted
away from Mainland Asia and drifted toward the rest of the Philippine
Archipelago {% cite Siler2012 %}.

#### Genomic data

We are currently collecting genome-wide sequence data from nearly 300
individuals of *Cyrtodactylus* and *Gekko* from across the Philippine
Archipelago.
We hope that combining these NGS data with new methods we are developing will
allow us to better assess the affect of sea-level fluctuations on
diversification across oceanic islands of Southeast Asia.

### Comparative phylogeography

To more directly test whether glacial cycles promoted diversification, we are
also taking a broadly comparative approach.
For example, we accumulated genetic data from island populations of 22
distantly related taxa, representing five orders of terrestrial vertebrates.
For each taxon, we sampled genetic data from two populations currently on
separate Philippine Islands that were previously connected during glacial
periods {% cite Oaks2012 %}.
If repeated bouts of island connectivity and isolation promoted
diversification, the temporal distribution of divergences across the 22
inter-island pairs of populations should be temporally clustered and correspond
to interglacial rises in sea level that fragmented the islands.
To test this prediction, we employed a popular Bayesian model-choice method,
msBayes, to estimate the probabilities of models in which multiple sets of taxa
diverged at the same time.
We found very strong support (posterior probability > 0.98) for a single,
recent, simultaneous divergence event shared by all 22 taxa.

<figure>
    <a href="/images/philippines-shared-divs.png"><img src="/images/philippines-shared-divs.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Cartoon example of shared divergence times due to interglacial
                rises in sea levels.
            </span>
        </p>
    </figcaption>
</figure>

Suspicious of such strong support given the number, richness, and stochasticity
of the candidate models of divergence,
we used computer simulations to assess the ability of the msBayes method to
detect random variation in divergence times.
The results of the simulations revealed that the method will often strongly
support highly clustered models of divergence even when the taxa being compared
diverged randomly over millions of generations {% cite Oaks2012 Oaks2014reply %}.
Thus, our results from the empirical Philippines data were likely spurious.

This motivated us to formulate the full evolutionary model
underlying the simulation-based msBayes procedure and, using first 
principles of probability, identify theoretical reasons the method
would tend to spuriously infer clustered divergences across
taxa {% cite Oaks2012 Oaks2014reply %}.
Guided by these insights, we developed a new method that uses more flexible
prior probability distributions for many of the models' parameters, and a
nonparametric Dirichlet-process prior across all possible divergence models.
We implemented the new model in the software package dpp-msbayes, and developed
a much more efficient multi-processing interface for both dpp-msbayes and
msBayes.
Using analyses of simulated and empirical data, we found, as predicted by
theory, the new method was much more accurate and robust {% cite Oaks2014dpp %}.
Applying this new method to the comparative Philippines dataset, we found a
large amount of uncertainty about the number of divergence events shared across
the 22 taxa.
As a result, we are currently working on developing more powerful methods that
can leverage large, comparative NGS datasets for addressing questions about
diversification.

---

## Diversification of Crocodiles

<a href="/images/croc-evol-cover.jpg"><img class="image-float-right" width="40%" style="border:1px solid black" src="/images/croc-evol-cover-small.jpg"></a>
How and when did crocodiles get to where they are today? How many species are
there? Where and when did their common ancestor live?
Motivated by these questions, and the fact that crocodiles are awesome, I
collected a large dataset of DNA sequences from all extant crocodylian species
and used statistical phylogenetic methods to infer the temporal and
biogeographical origin of the "true" crocodiles, *Crocodylus*.
The leading hypothesis was that *Crocodylus* originated in Africa, however,
**when** was a lot more uncertain.
Traditionally, crocodiles were stereotyped as an ancient group of "living
fossils", but molecular data and reassessment of paleontological data suggested
the genus might be younger than previously believed.

The DNA data I collected were strongly inconsistent with the hypotheses that
the common ancestor of *Crocodylus* was (1) ancient and (2) from Africa.
Rather, my results support that all extant crocodiles shared a common ancestor
from the Indo-Pacific, approximately 14--8 million years ago
{% cite Oaks2011 %}.
This rejects a vicariant explanation of their biogeography in favor of a
recent, dispersal-mediated model involving multiple transoceanic dispersals.
Interestingly, it was not until after the mid-Miocene climatic optimum, when
the global climate was cooling and fellow crocodylian lineages were suffering
massive extinctions, that *Crocodylus* radiated and dispersed around the globe.
These findings raise interesting questions about how and why *Crocodylus* fared
so well during a period with the highest crocodilian extinction rate over the
last 100 million years.

<figure>
    <a href="/images/croc-phylo.png"><img src="/images/croc-phylo-small.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Summary of the fossil-calibrated species tree and
                biogeographical character-state reconstruction, supporting the
                <i>Crocodylus</i> ancestor within the Indo-Pacific and subsequent
                diversification after the mid-Miocene climatic optimum.
            </span>
        </p>
    </figcaption>
</figure>


This work has been highlighted in:

*   [Nature](http://www.nature.com/nature/journal/v474/n7353/full/474545a.html)
*   [Sciworthy](http://sciworthy.com/science-news/science-authors/whos-the-living-fossil/)
*   [Nautilus](http://nautil.us/issue/22/slow/the-rise-and-fall-of-the-living-fossil)

---

## Data

*   We make our data available in repositories; please see our [papers][1] for
    specific locations. Additionally, there are some "odds and ends" available
    for download [here][2].

---

## References

{% bibliography --cited %}


 [1]: {{ site.baseurl }}/publications/
 [2]: {{ site.baseurl }}/research/data/
