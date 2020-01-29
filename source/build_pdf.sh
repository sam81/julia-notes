#!/bin/sh

#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book(input='julia_notes.Rmd', output='bookdown::pdf_book', output_dir='../latex')"

cp ../latex/julia_notes.pdf ../gitbook/julia_notes.pdf
# lualatex julia_notes.tex
# biber julia_notes.tex
# lualatex julia_notes.tex
# cp julia_notes.pdf ../latex/julia_notes.pdf
# cp julia_notes.pdf ../gitbook/julia_notes.pdf

./clean_up.sh
