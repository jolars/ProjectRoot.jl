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
    Dict(".svn" => :dir)
  ]

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
      # Cannot go up any further; must be file system root.
      return dir
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

```jldoctest
julia> using ProjectRoot;

julia> @projectroot("dir") == pwd() * "dir"
true
```
"""
macro projectroot(args::Union{AbstractString,Expr}...)
  source_file = String(__source__.file)

  args_parsed = [isa(arg, Expr) ? eval(arg) : arg for arg in args]

  for arg in args_parsed
    if ~isa(arg, AbstractString)
      throw(DomainError(args, "Arguments to @projectroot must be strings or expressions that evaluate to strings."))
    end
  end

  if startswith(source_file, "REPL")
    return joinpath(pwd(), args_parsed...)
  end

  current_dir = dirname(source_file)

  return joinpath(find_root(current_dir), args_parsed...)
end


export @projectroot

end

