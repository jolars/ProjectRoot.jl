# ProjectRoot.jl

A package for Julia that provides easy file-referencing for project-oriented workflows.

## Installation

You can install the package using the Julia package manager:

```julia
]add ProjectRoot
```

Alternatively, you can also install the latest development version of the package from the source code on GitHub by calling

```julia
using Pkg
Pkg.add(url = "https://github.com/jolars/ProjectRoot.jl")
```

## Getting Started

The package provides a single macro, `@projectroot`, that can be used to reference files in your project. The idea is to in some file `A.jl` be able to reference another file `B.jl` somewhere else in your project without having to care where file `A.jl` is or need to update the reference if you move `A.jl` somewhere else.

Take this example project:

```
MyProject
├── scripts
│   └── A.jl
├── src
│   └── B.jl
└── Project.toml
```

If you want to include `B.jl` from `A.jl`, all you need to do is this:

```julia
include(@projectroot("src", "B.jl"))
```

Now, calling `A.jl` from anywhere in your project will work as expected. And if you move `A.jl` to another folder, say `scripts/subfolder`, the import will still work.

`@projectroot` also handles calling lines from `A.jl` through the REPL, by fetching the current working directory.

## How Does it Work?

The `@projectroot` macro works by fetching the current file from where it is called and then recursively search upwards in the file hierarchy until it finds one of the following:

1. A `.projectroot` file
2. A `Project.toml` file
3. A `JuliaProject.toml` file
4. A `Manifest.toml` file
5. A `.git` folder
6. A `.svn` folder

It stops searching when it finds one of these files or when you reach the root of the file system.

The `.projectroot` file is just a file that allows you to manually specify the root of your project and its contents will be ignored.

If `@projectroot` is called from the REPL, it will instead simply return the current working directory (result of calling `pwd()`).

## Acknowledgements

This package is inspired by similar packages for other languages, such as the R package [here](https://here.r-lib.org/) and the Python package [pyprojroot](https://pypi.org/project/pyprojroot/).

The logo is a modified version of an [image by macrovector on Freepik](https://www.freepik.com/free-vector/old-dark-trees-with-roots-dead-forest-trees-black-silhouette-dead-tree-illustration_13422920.htm#query=roots&position=1&from_view=keyword&track=sph&uuid=3396f5e2-c3d2-416a-bc83-c88226ba85a7).

## Alternatives

The excellent [DrWatson.jl](https://github.com/JuliaDynamics/DrWatson.jl) package provides the same functionality as **ProjectRoot** but also much more. The motivation for this package was to provide a simpler alternative for those who do not need all the bells and whistles.
