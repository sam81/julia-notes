
out_dir = "extracted_code/"
dir.create(out_dir, recursive=T, showWarnings=F)

fNames = c("julia_notes.Rmd",
  "simple_intro.Rmd",
  "datatypes.Rmd",
  "mutable_immutable.Rmd",
  "installing_packages.Rmd",
  "dataframes.Rmd",
  "workflow.Rmd",
  "plotlyJS.Rmd",
  "gadfly.Rmd",
  "ggplot2.Rmd",
  "vegalite.Rmd",
  "pyplot.Rmd",
  "parallel_processing.Rmd",
  "generating_packages.Rmd",
  "sound.Rmd"
  )

for (fName in fNames){
    fOut = paste0(strsplit(fName, split=".", fixed=T)[[1]][1], ".jl")
    knitr::purl(fName, output=paste0(out_dir, fOut))
    ll = readLines(paste0(out_dir, fOut))
    for (n in 1:length(ll)){
        ll[n] = substr(ll[n], 4, nchar(ll[n]))
    }
    ## remove Pkg commands
    for (n in 1:length(ll)){
        if (substr(ll[n], 1, 3) == "Pkg"){
            ll[n] = paste0("##", ll[n])
        }
    }
    writeLines(ll, paste0(out_dir, fOut))
}
