## Installing and managing packages 

There are two ways of installing and managing packages in Julia. One is through functions at the Julia REPL, the other is through the package manager REPL. For example, to install the `Gadfly` package from the Julia REPL you can use the `Pkg.add` function:

````julia

Pkg.add("Gadfly")
````




to do the same from the package manager REPL you need to first access the package manager REPL by typing `]` in the Julia REPL. Once you've entered the package manager REPL, which should show `pkg>` in the prompt, you can install a package using the `add` command:

````julia

add Gadfly
````




To update your packages to their latest version you can use the `Pkg.update()` command from the julia REPL, or the `up` command from the package manager REPL.

To remove a package you can use the `Pkg.rm("packageName")` command from the Julia REPL, or the `rm packageName` command from the package manager REPL.
