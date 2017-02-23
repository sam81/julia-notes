using Documenter, Weave

## fls = ["dataframes.Rmd", "datatypes.Rmd", "index.Rmd",
##        "parallel_processing.Rmd", "plotting.Rmd"]
       
## for fl in fls
##     println("Weaving "*fl)
##     weave(string("raw_docs/", fl), informat="markdown",
##           out_path = "src/", doctype = "github")
## end

fls = ["dataframes.Rmd", "datatypes.Rmd", "index.Rmd",
       "parallel_processing.Rmd", "plotting.Rmd"]

cd("raw_docs")
for fl in fls
    println("Weaving "*fl)
    weave(fl, informat="markdown",
          out_path = "../src/", doctype = "github")
end

cd("../")

makedocs()
