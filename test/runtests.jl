using ProjectRoot
using Test

@testset "ProjectRoot.jl" begin
  project_root = @projectroot()

  @test endswith(project_root, "ProjectRoot") || endswith(project_root, "ProjectRoot.jl")

  mktempdir() do dir
    # Create a .projectroot file in the temporary directory
    touch(joinpath(dir, ".projectroot"))

    script_file = joinpath(dir, "script.jl")
    touch(script_file)

    file = open(script_file, "w")
    println(file, "using ProjectRoot;print(@projectroot())")
    close(file)

    out = read(`julia --project=. $script_file`, String)

    @test out == dir
  end

  # Check that the macro works with expressions
  a = @projectroot("dirfile")
  b = @projectroot("dir" * "file")
  @test a == b

end

include(@projectroot("test", "aqua.jl"))
