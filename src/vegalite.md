##Vegalite

````julia
using VegaLite, RDatasets
iris = dataset("datasets", "iris")

p = iris |> @vlplot(:point,
                    x=:SepalLength,
                    y=:SepalWidth,
                    color=:Species,
                    width=400,
                    height=400
                    );
save("../src/figures/iris_sep_wd_by_len.png", p)
````





![](figures/iris_sep_wd_by_len.png)
