##Gadfly

````julia
using Gadfly

x = collect(0:0.1:2*pi)
plot(x=x, y=sin.(x), Geom.line,
     Guide.xlabel("Angle (radians)"), Guide.ylabel("Amplitude"))
````


````
Error: The Cairo and Fontconfig packages are necessary for saving as PNG.
Add them with the package manager if necessary, then run:
  import Cairo, Fontconfig
before invoking PNG.
````


![](figures/gadfly_1_1.png)

````julia
using RDatasets
iris = dataset("datasets", "iris")
plot(iris, x="SepalLength", y="SepalWidth", color="Species", Geom.point)
````


````
Error: The Cairo and Fontconfig packages are necessary for saving as PNG.
Add them with the package manager if necessary, then run:
  import Cairo, Fontconfig
before invoking PNG.
````


![](figures/gadfly_2_1.png)



Facets:

````julia
plot(iris, xgroup="Species", x="SepalLength", y="SepalWidth", Geom.subplot_grid(Geom.point))
````


````
Error: The Cairo and Fontconfig packages are necessary for saving as PNG.
Add them with the package manager if necessary, then run:
  import Cairo, Fontconfig
before invoking PNG.
````


![](figures/gadfly_3_1.png)

````julia
oats = dataset("MASS", "oats")
oats[:Nitro] = [parse(Float64, split(oats[:N][i], "c")[1]) for i=1:length(oats[:N])]
set_default_plot_size(16cm, 16cm)
plot(oats, xgroup="V", ygroup="B", x="Nitro", y="Y", Geom.subplot_grid(Geom.point, Geom.line), Guide.xlabel("Nitro by Variety"), Guide.ylabel("Yeld By Block"))
````


````
Error: The Cairo and Fontconfig packages are necessary for saving as PNG.
Add them with the package manager if necessary, then run:
  import Cairo, Fontconfig
before invoking PNG.
````


![](figures/gadfly_4_1.png)
