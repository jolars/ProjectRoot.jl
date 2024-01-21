"""
    module Here

This module provides a macro to build paths relative to the root directory of the project.
"""
module Here

using FilePathsBase

function find_root_dir(current_dir)
  patterns = [
    Dict(".here" => :file),
    Dict("Project.toml" => :file),
    Dict("Manifest.toml" => :file),
    Dict(".git" => :dir),
    Dict(".svn" => :dir)
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
    @here(args...)

This macro returns a path relative to the root directory of the project.
"""
macro here(args::String...)
  current_dir = String(__source__.file)
  if startswith(current_dir, "REPL")
    current_dir = pwd()
  end
  joinpath(find_root_dir(expanduser(current_dir)), args...)
end

export @here

end
