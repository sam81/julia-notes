##### Data Types

Initializing vectors of a given type:

```julia
x = (Int)[] #integer
y = (Real)[] #floating point
z = (ASCIIString)[] # string
```

you can then `push!` elements inside the vectors

```julia
push!(x, 3)
push!(y, 3.2)
push!(z, "abc")
```
Nested dictionaries:

```julia
mydict = Dict{ASCIIString, Any}()
mydict["nest1"] = Dict{ASCIIString, Any}()
mydict["nest1"]["nest2"] = [1,2,3]
```
