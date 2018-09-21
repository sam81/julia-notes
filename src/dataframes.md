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





let's create a numeric vector and a string vector of the same length, and then put them in a dataframe:

````julia
y = rand(10)
cnd = [["a" for i=1:5]; ["b" for i=1:5]]
resFrame =  DataFrame(y=y, cnd=cnd)
````





to access the columns of a dataframe use the following syntax:

````julia
resFrame[:y] #retrieves the column named `y`
resFrame[:cnd] #retrieves the column named `cnd`
````


````
10-element Array{String,1}:
 "a"
 "a"
 "a"
 "a"
 "a"
 "b"
 "b"
 "b"
 "b"
 "b"
````





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


````
10-element Array{Float64,1}:
 0.524485 
 0.751981 
 0.622919 
 0.81969  
 0.0886836
 0.54748  
 0.934634 
 0.28916  
 0.432015 
 0.0467469
````





you can also retrieve a column by its column number

````julia
resFrame[1]
````


````
10-element Array{Float64,1}:
 0.524485 
 0.751981 
 0.622919 
 0.81969  
 0.0886836
 0.54748  
 0.934634 
 0.28916  
 0.432015 
 0.0467469
````





to write a dataframe to a text of CSV file, use:

````julia
CSV.write("dataframe.csv", resFrame)
````


````
CSV.Sink{Void,DataType}(    CSV.Options:
        delim: ','
        quotechar: '"'
        escapechar: '\\'
        missingstring: ""
        dateformat: nothing
        decimal: '.'
        truestring: 'true'
        falsestring: 'false'
        internstrings: true, IOBuffer(data=UInt8[...], readable=true, writa
ble=true, seekable=true, append=false, size=0, maxsize=Inf, ptr=1, mark=-1)
, "dataframe.csv", 6, true, String["y", "cnd"], 2, false, Val{false})
````





it is also possible to specify a separator, note that the separator character must be enclosed by
single ticks `''`:

````julia
CSV.write("dataframe.csv", resFrame, delim=';')
````


````
CSV.Sink{Void,DataType}(    CSV.Options:
        delim: ';'
        quotechar: '"'
        escapechar: '\\'
        missingstring: ""
        dateformat: nothing
        decimal: '.'
        truestring: 'true'
        falsestring: 'false'
        internstrings: true, IOBuffer(data=UInt8[...], readable=true, writa
ble=true, seekable=true, append=false, size=0, maxsize=Inf, ptr=1, mark=-1)
, "dataframe.csv", 6, true, String["y", "cnd"], 2, false, Val{false})
````





Selecting:

````julia

ds[(ds[:montage] .== "FzIpsiMast") & (ds[:ear] .== "both"), :]
````

