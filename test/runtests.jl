using ProjectRoot
using Test

@testset "ProjectRoot.jl" begin
  project_root = @projectroot()

  @test endswith(here, "ProjectRoot") || endswith(here, "ProjectRoot.jl")

  mktempdir() do dir
    # Create a .here file in the temporary directory
    touch(joinpath(dir, ".here"))

    script_file = joinpath(dir, "script.jl")
    touch(script_file)

    file = open(script_file, "w")
    println(file, "using ProjectRoot;print(@projectroot())")
    close(file)

    out = read(`julia --project=. $script_file`, String)

    @test out == dir
  end

end

include(@projectroot("test", "aqua.jl"))
