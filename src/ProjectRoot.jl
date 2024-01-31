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
"""
macro projectroot(args::String...)
  source_file = String(__source__.file)

  if startswith(source_file, "REPL")
    return joinpath(pwd(), args...)
  end

  current_dir = dirname(source_file)

  return joinpath(find_root(current_dir), args...)
end


export @projectroot

end

