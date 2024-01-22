# Here
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://jolars.github.io/Here.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://jolars.github.io/Here.jl/dev)
[![Build Status](https://github.com/jolars/Here.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/jolars/Here.jl/actions/workflows/CI.yml?query=branch%3Amain)

A package for Julia that provides easy file-referencing for project-oriented workflows.

## Installation

You can install the package using the Julia package manager from the source code on GitHub:

```julia
using Pkg
Pkg.add("https://github.com/jolars/Here.jl")
```

A stable release will be available on the Julia package registry soon.

## Getting Started

The package provides a single macro, `@here`, that can be used to reference files in your project. The idea is to in some file `A.jl` be able to reference another file `B.jl` somewhere else in your project without having to care where file `A.jl` is or need to update the reference if you move `A.jl` somewhere else.

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
include(@here("src", "B.jl"))
```

Now, calling `A.jl` from anywhere in your project will work as expected. And if you move `A.jl` to another folder, say `scripts/subfolder`, the import will still work.

`@here` also handles calling lines from `A.jl` through the REPL, by fetching the current working directory.

## How Does it Work?

The `@here` macro works by fetching the current file from where it is called and then recursively search upwards in the file hierarchy until it finds one of the following:

1. A `.here` file
2. A `Project.toml` file
3. A `Manifest.toml` file
4. A `.git` folder
5. A `.svn` folder

It stops searching when it finds one of these files or when you reach the root of the file system.

The `.here` file is just a file that allows you to manually specify the root of your project and its contents will be ignored.

If `@here` is called from the REPL, it will instead simply return the current working directory (result of calling `pwd()`).

## Acknowledgements

This package is mostly a direct port of the R package [here](https://here.r-lib.org/).

## Alternatives

The excellent [DrWatson.jl](https://github.com/JuliaDynamics/DrWatson.jl) package provides the same functionality as **Here** but also much more. The motivation for this package was to provide a simpler alternative for those who do not need all the bells and whistles.
