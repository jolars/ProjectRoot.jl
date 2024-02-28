"""
    module ProjectRoot

This module provides a macro to build paths relative to the root directory of the project.
"""
module ProjectRoot

using FilePathsBase

function find_root(dir::String)
  patterns = [
    Dict(".projectroot" => :file),
    Dict("Project.toml" => :file),
    Dict("JuliaProject.toml" => :file),
    Dict("Manifest.toml" => :file),
    Dict(".git" => :dir),
    Dict(".svn" => :dir),
  ]

  base_dir = dir

  # Recursive search for root directory.
  while true
    prev_dir = dir

    for pattern_dict in patterns
      for (pattern, type) in pattern_dict
        if type == :file && isfile(joinpath(dir, pattern)) ||
           type == :dir && isdir(joinpath(dir, pattern))
          return dir
        end
      end
    end

    # Go to parent directory
    dir = dirname(dir)

    if dir == prev_dir
      # Cannot go up any further; must be file system root. Return the base directory
      return base_dir
    end
  end

  @assert false "We should not have ended up here."
end

"""
    @projectroot(args...)

This macro returns a path relative to the root directory of the project.

```julia
using ProjectRoot

@projectroot("dir", "file")
```

`@projectroot()` can also be used in the REPL, in which case it constructs a path relative to the current working directory.

```
julia> using ProjectRoot;
julia> @projectroot("dir") == joinpath(pwd(), "dir")
true
```
"""
macro projectroot(args::Union{AbstractString,Expr,Symbol}...)
  if isinteractive()
    return esc(:(joinpath(ProjectRoot.find_root(pwd()), $(args...))))
  end

  local source_file = String(__source__.file)
  local base_dir = find_root(dirname(source_file))

  return esc(:(joinpath($(base_dir), $(args...))))
end

export @projectroot

end
