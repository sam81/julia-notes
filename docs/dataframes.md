##### DataFrames

In Julia dataframes are handled by an addon package. It can be installed with:

```julia
Pkg.add("DataFrames")
```

to use DataFrames you need to load the package:

```julia
using DataFrames
```

let's create a numeric vector and a string vector of the same length, and then put them in a dataframe:

```julia
y = rand(10)
cnd = [["a" for i=1:5]; ["b" for i=1:5]]
resFrame =  DataFrame(y=y, cnd=cnd)
```

to access the columns of a dataframe use the following syntax:

```julia
resFrame[:y] #retrieves the column named `y`
resFrame[:cnd] #retrieves the column named `cnd`
```

you can also retrieve a column by its column number

```julia
resFrame[1]
```

to write a dataframe to a text of CSV file, use:

```julia
writetable("dataframe.csv", resFrame)
```

it is also possible to specify a separator, note that the separator character must be enclosed by
single ticks `''`:

```julia
writetable("dataframe.csv", resFrame, separator=';')
```
