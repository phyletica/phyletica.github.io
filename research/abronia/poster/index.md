---
layout: page
title: Population genomics of the arboreal alligator lizard, <i>Abronia campbelli</i>
excerpt: "Investigating genomic effects of extreme isolation."
author: phyletica 
share: false
image:
  feature: header-koh-rong-lone-boat.jpg
  credit: Jamie Oaks
  creditlink: http://phyletica.github.io
---


<div markdown="0" ><a class="btn btn-info" href="{{ site.baseurl }}/research/abronia/poster/map">Please click here an interactive map of sampling localities!</a></div>

## Authors

Natalie Winters, Rebecca Meyer,
[Morgan Muell](https://morganmuell.wixsite.com/home),
and [Jamie Oaks]({{ site.baseurl }})

## Introduction

*Abronia* alligator lizards are arboreal reptiles spanning southern Mexico and
Central America. Some *Abronia* species endemic to eastern Guatemala, such as
*Abronia campbelli* and *Abronia frosti*, are classified as critically
endangered {% cite ArianoSanchez2009 %};
the expansion of farmland in this area has left many populations of *A.
campbelli* isolated to single trees.
Understanding how the isolation and fragmentation of populations can affect
genetic diversity and structure of a species is critical for informing
conservation and management efforts.
The goal of this project was to **investigate whether recent extreme isolation
of the agricultural populations has left a signature in the lizard's genomes.**

## Methods

### Collection, Genomic Library Prep and Sequencing
Blood samples from 45 *Abronia* lizards located in various populations in
Eastern Guatemala were preserved on FTA cards.

### Assembly of Genomic Loci
After extracting DNA from the blood samples, we sequenced tens of thousands of
regions of the lizards' genomes associated with the restriction sites
{% cite BayonaVasquez2019 %}.
To assemble and align the sequence data across the lizard samples, we used
ipyrad {% cite Eaton2020 %}.

### Principal Component Analysis (PCA)
To visualize the genetic variation among the *Abronia* alligator lizards, we used
a principal component analysis.

### IQ-TREE
To estimate the phylogenetic relationships among the sampled *Abronia* lizards, we 
used a maximum-likelihood search in IQ-TREE {% cite iqtree3 %}.

## Results

<figure>
    <a href="/images/abronia-iqtree-contree.png"><img src="/images/abronia-iqtree-contree.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Figure 1. Estimated maximum-likelihood phylogenetic tree of the sampled *Abronia* lizards.
            </span>
        </p>
    </figcaption>
</figure>

<figure>
    <a href="/images/abronia-pca.png"><img src="/images/abronia-pca.png"></a>
    <figcaption>
        <p class="figure-caption-box">
            <span class="center-if-single-line">
                Figure 2. Projection of genetic variation along the first and second principal components (PC).
            </span>
        </p>
    </figcaption>
</figure>

From the estimated phylogenetic tree (Figure 1), we can observe a monophyletic
group of 20 individuals from five separate populations of various levels of
isolation.
The members of this clade group together along the first principal component in
our PCA analysis (Figure 2).

This clade and group in the PCA does not correspond with any of the isolated
agricultural locations from which the lizards were sampled.
We do not see obvious signatures in the genomic diversity of the lizards left
by recent extreme isolation

## Conclusions

Within populations of *Abronia campbelli* in Eastern Guatemala, our principal
component analysis, phylogenetic tree, and satellite data do not indicate a
correspondence between extreme isolation imposed by agriculture and genomic
divergence. 

A better understanding of genetic variation among these isolated populations of
*Abronia* in eastern Guatemala can be used to inform further conservation efforts
and strategies.

## References

{% bibliography --cited %}
