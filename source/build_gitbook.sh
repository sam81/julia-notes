#!/bin/sh

Rscript -e "bookdown::render_book(input='julia_notes.Rmd', output_format='bookdown::gitbook', output_dir='../julia_notes')"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"

./clean_up.sh
