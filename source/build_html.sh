#!/bin/sh

Rscript -e "bookdown::render_book(input='julia_notes.Rmd', output='bookdown::html_book', output_dir='../html')"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"

./clean_up.sh
