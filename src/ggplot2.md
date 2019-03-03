##ggplot2 via RCall

It's possible to use `ggplot2` via the functionality provided by the `RCall` package in Julia:

````julia
using RCall, RDatasets
oats = dataset("MASS", "oats")
oats[:Nitro] = [parse(Float64, split(oats[:N][i], "c")[1]) for i=1:length(oats[:N])]
R"""library(ggplot2)"""
R"""p=ggplot($oats, aes(Nitro, Y))+facet_grid(B~V)+geom_point()"""
R"""ggsave("../src/figures/ggplot_oats.png", p)"""
````


````
RCall.RObject{RCall.NilSxp}
NULL
````





![](figures/ggplot_oats.png)
