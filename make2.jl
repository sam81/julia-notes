using Documenter, Weave

fls = ["pyplot.Rmd"]

cd("raw_docs")
for fl in fls
    println("Weaving "*fl)
    weave(fl, informat="markdown",
          out_path = "../src/", doctype = "github")
end

cd("../")

makedocs()

