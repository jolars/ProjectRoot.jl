module Here

using FilePathsBase

function find_root_dir(current_dir=@__DIR__)
    patterns = [
    Dict(".here" => :file),
    Dict("Project.toml" => :file),
    Dict("Manifest.toml" => :file),
    Dict(".git" => :dir),
    Dict(".svn" => :dir),
  ]

  # Recurse up the directory tree until we find a match
  while current_dir != "/"
    for pattern_dict in patterns
      for (pattern, type) in pattern_dict
        if type == :file && isfile(joinpath(current_dir, pattern)) ||
           type == :dir && isdir(joinpath(current_dir, pattern))
          return current_dir
        end
      end
    end
    current_dir = dirname(current_dir)
  end
  error("Project root not found")
end

"""
    here(args...)

This function constructs paths relative to the project root. It takes any number of arguments, 
which represent the path components.
"""
here(args...) = joinpath(find_root_dir(), args...)

export here

end
