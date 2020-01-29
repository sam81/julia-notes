#!/bin/sh

Rscript -e "bookdown::render_book(input='julia_notes.Rmd', output='bookdown::epub_book', output_dir='../ebook')"

cp ../ebook/julia_notes.epub ../gitbook 

./clean_up.sh
