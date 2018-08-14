##Gadfly

````julia
using Gadfly
````


<pre class="julia-error">
ERROR: Failed to precompile Gadfly &#91;c91e804a-d5a3-530f-b6f0-dfbca275c004&#93; to /home/sam/.julia/compiled/v0.7/Gadfly/DvECm.ji.
</pre>


````julia

x = collect(0:0.1:2*pi)
plot(x=x, y=sin.(x), Geom.line,
     Guide.xlabel("Angle (radians)"), Guide.ylabel("Amplitude"))
````


<pre class="julia-error">
ERROR: UndefVarError: Guide not defined
</pre>

