##Gadfly

````julia
using Gadfly

x = collect(0:0.1:2*pi)
plot(x=x, y=sin.(x), Geom.line,
     Guide.xlabel("Angle (radians)"), Guide.ylabel("Amplitude"))
````


![](figures/gadfly_1_1.png)
