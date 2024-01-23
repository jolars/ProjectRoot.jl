# ProjectRoot <a href="https://jolars.github.io/ProjectRoot.jl/"><img src='src/assets/logo.svg' align="right" height="139" /></a>

[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://jolars.github.io/ProjectRoot.jl/stable)
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://jolars.github.io/ProjectRoot.jl/dev)
[![Build Status](https://github.com/jolars/ProjectRoot.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/jolars/ProjectRoot.jl/actions/workflows/CI.yml?query=branch%3Amain)

A package for Julia that provides easy file-referencing for project-oriented workflows.

## Installation

You can install the package using the Julia package manager from the source code on GitHub:

```julia
using Pkg
Pkg.add("https://github.com/jolars/ProjectRoot.jl")
```

A stable release will be available on the Julia package registry soon.

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

## Contributing

When writing commit messages, please use the [conventional commits format](https://www.conventionalcommits.org/en/v1.0.0/).

## Versioning

ProjectRoot uses [semantic versioning](https://semver.org).
