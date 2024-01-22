using Here
using Test

@testset "Here.jl" begin
  here = Here.@here()

  @test endswith(here, "Here") || endswith(here, "Here.jl")

  mktempdir() do dir
    # Create a .here file in the temporary directory
    touch(joinpath(dir, ".here"))

    script_file = joinpath(dir, "script.jl")
    touch(script_file)

    file = open(script_file, "w")
    println(file, "using Here;print(@here())")
    close(file)

    out = read(`julia --project=. $script_file`, String)

    @test out == dir
  end

end

include(@here("test", "aqua.jl"))
