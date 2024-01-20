module Here

using FilePathsBase

"""
    iam()

This function returns the current directory path. It checks for the presence of certain files or directories 
(".here", "Project.toml", "Manifest.toml", ".git", ".svn") in the current directory and its parent directories. 
If any of these files or directories are found, the function returns the path of that directory. 
If none of these files or directories are found after traversing up to the root directory, 
the function throws an error "Project root not found".
"""
function iam()
  current_dir = @__DIR__

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
which represent the path components, and joins them with the path returned by the `iam()` function.
"""
here(args...) = joinpath(iam(), args...)

export here

end
