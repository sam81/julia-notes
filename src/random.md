## Random Numbers and Sampling

One of the fundamental functions to generate random number and random sampling in Julia is `rand`. This function picks random elements from a collection of items. If the function is called without arguments it will generate a random 64-bit floating point number between 0 and 1 because that is the default collection:

````julia
rand()
````


````
0.3756298549353758
````





to generate a random integer between say 1 and 100 we need to pass that collection as an argument:

````julia
rand(1:100)
````


````
94
````





the collection to sample from could be something different than numbers. For example we can generate a sequence of letters and sample from it:

````julia
lettersSeq = ["a", "b", "c", "d"]
rand(lettersSeq)
````


````
"c"
````





to generate more than one element we need to specify the dimensions of the vector or matrix of elements that we want to generate:

````julia
rand(1:100, 10) #generate a 10-elements vector of
	        #random integers between 1 and 100
rand(1:100, 2, 5) #generate a 2x5 matrix of
	          #random integers between 1 and 100
````




	
### Setting the random seed

It is sometimes desirable that a call to a random number generator actually generates the same "random" sequence each time it is called at a specific point in a script (e.g. to make an example reproducible). To achieve this it is necessary to explicitly initialize the random number generator with a ["seed"](https://en.wikipedia.org/wiki/Random_seed). In julia this can be done with the `srand` function in the standard library package `Random`:
   
````julia

import Random
Random.seed!(375)
````

