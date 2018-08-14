## DataFrames

In Julia dataframes are handled by an addon package. It can be installed with:

````julia

Pkg.add("DataFrames")
````




it's very likely that you will want to read and write dataframes as CSV files at some stage. This functionality is provided by the `CSV.jl` package, so you should install it as well:

````julia

Pkg.add("CSV")
````




to use the `DataFrames` and `CSV` packages you need to load them:

````julia
using CSV, DataFrames
````


<pre class="julia-error">
ERROR: ArgumentError: Package CSV not found in current path:
- Run &#96;Pkg.add&#40;&quot;CSV&quot;&#41;&#96; to install the CSV package.

</pre>




let's create a numeric vector and a string vector of the same length, and then put them in a dataframe:

````julia
y = rand(10)
cnd = [["a" for i=1:5]; ["b" for i=1:5]]
resFrame =  DataFrame(y=y, cnd=cnd)
````


<pre class="julia-error">
ERROR: UndefVarError: DataFrame not defined
</pre>




to access the columns of a dataframe use the following syntax:

````julia
resFrame[:y] #retrieves the column named `y`
````


<pre class="julia-error">
ERROR: UndefVarError: resFrame not defined
</pre>


````julia
resFrame[:cnd] #retrieves the column named `cnd`
````


<pre class="julia-error">
ERROR: UndefVarError: resFrame not defined
</pre>




note that `:y` or `:cnd` are *Symbols*:

````julia
typeof(:y)
````


````
Symbol
````





sometimes it is necessary to access the column of a dataframe using a string. You can do so by converting a string to a symbol:

````julia
resFrame[Symbol("y")]
````


<pre class="julia-error">
ERROR: UndefVarError: resFrame not defined
</pre>




you can also retrieve a column by its column number

````julia
resFrame[1]
````


<pre class="julia-error">
ERROR: UndefVarError: resFrame not defined
</pre>




to write a dataframe to a text of CSV file, use:

````julia
CSV.write("dataframe.csv", resFrame)
````


<pre class="julia-error">
ERROR: UndefVarError: CSV not defined
</pre>




it is also possible to specify a separator, note that the separator character must be enclosed by
single ticks `''`:

````julia
CSV.write("dataframe.csv", resFrame, delim=';')
````


<pre class="julia-error">
ERROR: UndefVarError: CSV not defined
</pre>




Selecting:

````julia

ds[(ds[:montage] .== "FzIpsiMast") & (ds[:ear] .== "both"), :]
````

