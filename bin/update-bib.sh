#!/bin/sh

# pybtex converts '~' to \\textasciitilde. Using sed below to convert back
bibfilter.py ~/texmf/bibtex/bib/references.bib | grep -i -v 'author+an\|effort[[:blank:]]*=\|^[[:blank:]]*%\|keywords[[:blank:]]*=' | sed -e "s/\\\textasciitilde /~/g" > ../_bibliography/jro.bib
