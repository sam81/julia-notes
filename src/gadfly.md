##Gadfly

````julia
using Gadfly

x = collect(0:0.1:2*pi)
plot(x=x, y=sin.(x), Geom.line,
     Guide.xlabel("Angle (radians)"), Guide.ylabel("Amplitude"))
````


<pre class="julia-error">
ERROR: Cairo and Fontconfig are necessary for the PNG backend. Run:
  Pkg.add&#40;&quot;Cairo&quot;&#41;
  Pkg.add&#40;&quot;Fontconfig&quot;&#41;
You also have to delete /home/sam/.julia/lib/v0.6/Compose.ji
and restart your REPL session afterwards.

</pre>

![](figures/gadfly_1_1.png)
