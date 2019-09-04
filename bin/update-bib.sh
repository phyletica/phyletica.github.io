#!/bin/sh

bibfilter.py ~/texmf/bibtex/bib/references.bib | grep -v "author+an" > ../_bibliography/jro.bib

