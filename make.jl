using Documenter, DocumenterMarkdown, Weave

if ispath("build/")
    rm("build/", recursive=true)
end

if ispath("site/")
    rm("site/", recursive=true)
end

fls = ["dataframes.Rmd", "datatypes.Rmd", "index.Rmd",
       "parallel_processing.Rmd", "gadfly.Rmd", "random.Rmd", "workflow.Rmd"]


cd("raw_docs")
for fl in fls
    println("Weaving "*fl)
    weave(fl, informat="markdown",
          out_path = "../src/", doctype = "github")
end


cd("../")

makedocs(format = Markdown())

