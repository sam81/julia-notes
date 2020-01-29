using Documenter, DocumenterMarkdown, Weave

if ispath("build/")
    rm("build/", recursive=true)
end

if ispath("site/")
    rm("site/", recursive=true)
end

fls = ["creating_packages.Rmd",
       "installing_packages.Rmd",
       "dataframes.Rmd", "datatypes.Rmd",
       "gadfly.Rmd", "ggplot2.Rmd",
       "index.Rmd",
       "mutable_immutable.Rmd",
       "parallel_processing.Rmd",
       "plotlyJS.Rmd",
       "random.Rmd",
       "sound.Rmd", "simple_intro.Rmd",
       "vegalite.Rmd", "workflow.Rmd"]


cd("raw_docs")
for fl in fls
    println("Weaving "*fl)
    weave(fl, informat="markdown",
          out_path = "../src/", doctype = "github")
    tangle(fl, informat="markdown",
           out_path = "../tangled/")
end


cd("../")

makedocs(format = Markdown())

