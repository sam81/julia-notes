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




	
For the examples we'll use the `iris` dataset from the `RDatasets` package, so
we'll need to install it first if it's not already installed:
      
````julia

Pkg.add("RDatasets")
````



we can now load it and load the `iris` dataset:
   
````julia
using RDatasets
iris = dataset("datasets", "iris")
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
 0.3440663425278374 
 0.6633689409658656 
 0.9647833314009491 
 0.14813589246608672
 0.9882249595675341 
 0.3347175249264094 
 0.8183121928315318 
 0.8289771215415789 
 0.6140523825767787 
 0.20775408046859978
````





you can also retrieve a column by its column number

````julia
resFrame[1]
````


````
10-element Array{Float64,1}:
 0.3440663425278374 
 0.6633689409658656 
 0.9647833314009491 
 0.14813589246608672
 0.9882249595675341 
 0.3347175249264094 
 0.8183121928315318 
 0.8289771215415789 
 0.6140523825767787 
 0.20775408046859978
````





to write a dataframe to a text of CSV file, use:

````julia
CSV.write("dataframe.csv", resFrame)
````


````
"dataframe.csv"
````





it is also possible to specify a separator, note that the separator character must be enclosed by
single ticks `''`:

````julia
CSV.write("dataframe.csv", resFrame, delim=';')
````


````
"dataframe.csv"
````





### Displaying data on screen

To show the first few rows of a dataframe on screen you can use the `first`
function, which takes as arguments the name of the dataframe and the number of
rows that you want to show:
     	 
````julia
first(iris, 4)
````



<table class="data-frame"><thead><tr><th></th><th>SepalLength</th><th>SepalWidth</th><th>PetalLength</th><th>PetalWidth</th><th>Species</th></tr><tr><th></th><th>Float64</th><th>Float64</th><th>Float64</th><th>Float64</th><th>Categorical…</th></tr></thead><tbody><p>4 rows × 5 columns</p><tr><th>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr><tr><th>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr></tbody></table>



similarly to show the last few columns you can use the `last` command:
	  
````julia
last(iris, 4)
````



<table class="data-frame"><thead><tr><th></th><th>SepalLength</th><th>SepalWidth</th><th>PetalLength</th><th>PetalWidth</th><th>Species</th></tr><tr><th></th><th>Float64</th><th>Float64</th><th>Float64</th><th>Float64</th><th>Categorical…</th></tr></thead><tbody><p>4 rows × 5 columns</p><tr><th>1</th><td>6.3</td><td>2.5</td><td>5.0</td><td>1.9</td><td>virginica</td></tr><tr><th>2</th><td>6.5</td><td>3.0</td><td>5.2</td><td>2.0</td><td>virginica</td></tr><tr><th>3</th><td>6.2</td><td>3.4</td><td>5.4</td><td>2.3</td><td>virginica</td></tr><tr><th>4</th><td>5.9</td><td>3.0</td><td>5.1</td><td>1.8</td><td>virginica</td></tr></tbody></table>



If you have a dataframe with too many columns to fit the screen some will be truncated. To get around this you can use:
   
````julia

##create dataframe with lost of columns
df = DataFrame((Symbol('a' + i) => rand(10) for i in 0:100)...)
show(df, allcols=true)
````



		  
### Selecting rows

We've already seen how we can select a given column of a dataframe. Selecting
rows of a dataframe on the basis of one or more conditions is another fundamental
operation. 

the following command returns a boolean vector indicating whether 
each element in the `Species` column of the iris datasets is "setosa" or not:

````julia
idx = iris[:Species] .== "setosa";
````





we can use this vector to select the corresponding rows of the dataframe:
   	
````julia
iris[idx, :];
````





or more succintly we could achieve the same result with a single command:
   
````julia
iris[(iris[:Species] .== "setosa"), :];
````





we can also setect rows on the basis of multiple conditions, for example
only the ones for the setosa specimens with a petal length greater than 1.5:
     	
````julia
iris[(iris[:Species] .== "setosa") .& (iris[:PetalLength] .> 1.5), :]
````



<table class="data-frame"><thead><tr><th></th><th>SepalLength</th><th>SepalWidth</th><th>PetalLength</th><th>PetalWidth</th><th>Species</th></tr><tr><th></th><th>Float64</th><th>Float64</th><th>Float64</th><th>Float64</th><th>Categorical…</th></tr></thead><tbody><p>13 rows × 5 columns</p><tr><th>1</th><td>5.4</td><td>3.9</td><td>1.7</td><td>0.4</td><td>setosa</td></tr><tr><th>2</th><td>4.8</td><td>3.4</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>3</th><td>5.7</td><td>3.8</td><td>1.7</td><td>0.3</td><td>setosa</td></tr><tr><th>4</th><td>5.4</td><td>3.4</td><td>1.7</td><td>0.2</td><td>setosa</td></tr><tr><th>5</th><td>5.1</td><td>3.3</td><td>1.7</td><td>0.5</td><td>setosa</td></tr><tr><th>6</th><td>4.8</td><td>3.4</td><td>1.9</td><td>0.2</td><td>setosa</td></tr><tr><th>7</th><td>5.0</td><td>3.0</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>8</th><td>5.0</td><td>3.4</td><td>1.6</td><td>0.4</td><td>setosa</td></tr><tr><th>9</th><td>4.7</td><td>3.2</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>10</th><td>4.8</td><td>3.1</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>11</th><td>5.0</td><td>3.5</td><td>1.6</td><td>0.6</td><td>setosa</td></tr><tr><th>12</th><td>5.1</td><td>3.8</td><td>1.9</td><td>0.4</td><td>setosa</td></tr><tr><th>13</th><td>5.1</td><td>3.8</td><td>1.6</td><td>0.2</td><td>setosa</td></tr></tbody></table>



The `DataFramesMeta` package also provides convenient functions for selecting rows
of a dataframes on the basis of one or more conditions.

````julia
using DataFramesMeta
@where(iris, :Species .== "setosa")
````



<table class="data-frame"><thead><tr><th></th><th>SepalLength</th><th>SepalWidth</th><th>PetalLength</th><th>PetalWidth</th><th>Species</th></tr><tr><th></th><th>Float64</th><th>Float64</th><th>Float64</th><th>Float64</th><th>Categorical…</th></tr></thead><tbody><p>50 rows × 5 columns</p><tr><th>1</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>2</th><td>4.9</td><td>3.0</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>3</th><td>4.7</td><td>3.2</td><td>1.3</td><td>0.2</td><td>setosa</td></tr><tr><th>4</th><td>4.6</td><td>3.1</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>5</th><td>5.0</td><td>3.6</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>6</th><td>5.4</td><td>3.9</td><td>1.7</td><td>0.4</td><td>setosa</td></tr><tr><th>7</th><td>4.6</td><td>3.4</td><td>1.4</td><td>0.3</td><td>setosa</td></tr><tr><th>8</th><td>5.0</td><td>3.4</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>9</th><td>4.4</td><td>2.9</td><td>1.4</td><td>0.2</td><td>setosa</td></tr><tr><th>10</th><td>4.9</td><td>3.1</td><td>1.5</td><td>0.1</td><td>setosa</td></tr><tr><th>11</th><td>5.4</td><td>3.7</td><td>1.5</td><td>0.2</td><td>setosa</td></tr><tr><th>12</th><td>4.8</td><td>3.4</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>13</th><td>4.8</td><td>3.0</td><td>1.4</td><td>0.1</td><td>setosa</td></tr><tr><th>14</th><td>4.3</td><td>3.0</td><td>1.1</td><td>0.1</td><td>setosa</td></tr><tr><th>15</th><td>5.8</td><td>4.0</td><td>1.2</td><td>0.2</td><td>setosa</td></tr><tr><th>16</th><td>5.7</td><td>4.4</td><td>1.5</td><td>0.4</td><td>setosa</td></tr><tr><th>17</th><td>5.4</td><td>3.9</td><td>1.3</td><td>0.4</td><td>setosa</td></tr><tr><th>18</th><td>5.1</td><td>3.5</td><td>1.4</td><td>0.3</td><td>setosa</td></tr><tr><th>19</th><td>5.7</td><td>3.8</td><td>1.7</td><td>0.3</td><td>setosa</td></tr><tr><th>20</th><td>5.1</td><td>3.8</td><td>1.5</td><td>0.3</td><td>setosa</td></tr><tr><th>21</th><td>5.4</td><td>3.4</td><td>1.7</td><td>0.2</td><td>setosa</td></tr><tr><th>22</th><td>5.1</td><td>3.7</td><td>1.5</td><td>0.4</td><td>setosa</td></tr><tr><th>23</th><td>4.6</td><td>3.6</td><td>1.0</td><td>0.2</td><td>setosa</td></tr><tr><th>24</th><td>5.1</td><td>3.3</td><td>1.7</td><td>0.5</td><td>setosa</td></tr><tr><th>&vellip;</th><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td><td>&vellip;</td></tr></tbody></table>

````julia
@where(iris, :Species .== "setosa", :PetalLength .> 1.5)
````



<table class="data-frame"><thead><tr><th></th><th>SepalLength</th><th>SepalWidth</th><th>PetalLength</th><th>PetalWidth</th><th>Species</th></tr><tr><th></th><th>Float64</th><th>Float64</th><th>Float64</th><th>Float64</th><th>Categorical…</th></tr></thead><tbody><p>13 rows × 5 columns</p><tr><th>1</th><td>5.4</td><td>3.9</td><td>1.7</td><td>0.4</td><td>setosa</td></tr><tr><th>2</th><td>4.8</td><td>3.4</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>3</th><td>5.7</td><td>3.8</td><td>1.7</td><td>0.3</td><td>setosa</td></tr><tr><th>4</th><td>5.4</td><td>3.4</td><td>1.7</td><td>0.2</td><td>setosa</td></tr><tr><th>5</th><td>5.1</td><td>3.3</td><td>1.7</td><td>0.5</td><td>setosa</td></tr><tr><th>6</th><td>4.8</td><td>3.4</td><td>1.9</td><td>0.2</td><td>setosa</td></tr><tr><th>7</th><td>5.0</td><td>3.0</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>8</th><td>5.0</td><td>3.4</td><td>1.6</td><td>0.4</td><td>setosa</td></tr><tr><th>9</th><td>4.7</td><td>3.2</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>10</th><td>4.8</td><td>3.1</td><td>1.6</td><td>0.2</td><td>setosa</td></tr><tr><th>11</th><td>5.0</td><td>3.5</td><td>1.6</td><td>0.6</td><td>setosa</td></tr><tr><th>12</th><td>5.1</td><td>3.8</td><td>1.9</td><td>0.4</td><td>setosa</td></tr><tr><th>13</th><td>5.1</td><td>3.8</td><td>1.6</td><td>0.2</td><td>setosa</td></tr></tbody></table>



### Summarizing data

Summarizing data with the functions providing in the `DataFrames` package is
somwhat verbose:	   
	    
````julia
using Statistics	
summIris = by(iris, [:Species], df -> DataFrame(meanPetalWidth=mean(df[:PetalWidth])))
````




	
using the macros in `DataFramesMeta` is much better

````julia
summIris = @linq iris |> groupby(:Species) |> based_on(x = mean(:PetalWidth))
````





there are slightly different ways of achieving the same result:

````julia
@linq iris |> by(:Species, x=mean(:SepalWidth))
````



<table class="data-frame"><thead><tr><th></th><th>Species</th><th>x</th></tr><tr><th></th><th>Categorical…</th><th>Float64</th></tr></thead><tbody><p>3 rows × 2 columns</p><tr><th>1</th><td>setosa</td><td>3.428</td></tr><tr><th>2</th><td>versicolor</td><td>2.77</td></tr><tr><th>3</th><td>virginica</td><td>2.974</td></tr></tbody></table>


	  	
or:
		
````julia
@based_on(groupby(iris, :Species), x=mean(:PetalWidth))
````



<table class="data-frame"><thead><tr><th></th><th>Species</th><th>x</th></tr><tr><th></th><th>Categorical…</th><th>Float64</th></tr></thead><tbody><p>3 rows × 2 columns</p><tr><th>1</th><td>setosa</td><td>0.246</td></tr><tr><th>2</th><td>versicolor</td><td>1.326</td></tr><tr><th>3</th><td>virginica</td><td>2.026</td></tr></tbody></table>
