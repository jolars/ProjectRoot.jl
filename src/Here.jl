"""
    module Here

This module provides a function and a macro to find the root directory of a project.
It uses certain file and directory patterns to identify the root directory.
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

This macro returns the absolute path of the file or directory specified by `args...` 
relative to the root directory of the project. 
The root directory is determined by the `find_root_dir` function. 
If the macro is called from the Julia REPL, it uses the current working directory as the starting point.
"""
macro here(args...)
  current_dir = String(__source__.file)
  if startswith(current_dir, "REPL")
    current_dir = pwd()
  end
  joinpath(find_root_dir(expanduser(current_dir)), args...)
end

export @here

end
