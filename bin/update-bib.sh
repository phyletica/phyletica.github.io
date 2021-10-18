#!/bin/sh

bibfilter.py ~/texmf/bibtex/bib/references.bib | grep -i -v 'author+an\|effort[[:blank:]]*=\|^[[:blank:]]*%\|keywords[[:blank:]]*=' > ../_bibliography/jro.bib
