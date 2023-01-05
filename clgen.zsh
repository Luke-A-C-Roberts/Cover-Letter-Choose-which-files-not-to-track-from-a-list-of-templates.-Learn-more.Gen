#!/bin/zsh
rm temp.pdf
ruby gen.rb
nano temp.tex
pdflatex temp.tex -no-file-line-error
rm temp.aux
rm temp.log
rm temp.tex