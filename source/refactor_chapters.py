#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import os

## INSTRUCTIONS
## simply add or remove the name of a chapter (without the number)
## at the desired position in the list. Chapters will be renamed
## in the file system.
## Chap. names removed from the list are not deleted.

curr_chap_names = [
    "julia_notes.Rmd",
    "simple_intro.Rmd",
    "datatypes.Rmd",
    "mutable_immutable.Rmd",
    "installing_packages.Rmd",
    "dataframes.Rmd",
    "random.Rmd",
    "workflow.Rmd",
    "plotlyJS.Rmd",
    "gadfly.Rmd",
    "ggplot2.Rmd",
    "vegalite.Rmd",
    "pyplot.Rmd",
    "parallel_processing.Rmd",
    "generating_packages.Rmd",
    "sound.Rmd",
    "references.Rmd"
]

curr_files = os.listdir()
curr_files_stem = list()
for i in range(len(curr_files)):
    th = curr_files[i].split("_")
    th.pop(0)
    th = "_".join(th)
    curr_files_stem.append(th)

ord_chap_names = list()

for i in range(len(curr_chap_names)):
    if i <= 9:
        new_chap_name = "0" + str(i) + "_" + curr_chap_names[i]
    else:
        new_chap_name = str(i) + "_" + curr_chap_names[i]
    ord_chap_names.append(new_chap_name)

    if curr_chap_names[i] in curr_files_stem:
        idx = curr_files_stem.index(curr_chap_names[i])
        os.rename(curr_files[idx], ord_chap_names[i])
    else:
        open(ord_chap_names[i], 'a').close()

ymlF =open("_bookdown.yml", "w")
ymlF.write("new_session: yes \n\n")
ymlF.write('rmd_files: [\n')
for nm in ord_chap_names:
    ymlF.write('"' + nm + '",\n')
ymlF.write(']\n\n')
ymlF.write('book_filename: julia_notes\n')
ymlF.close()
