using Here
using Test

@testset "Here.jl" begin
  mktempdir() do dir
    # Create a .here file in the temporary directory
    touch(joinpath(dir, ".here"))

    script_file = joinpath(dir, "script.jl")
    touch(script_file)

    file = open(script_file, "w")
    println(file, "using Here;print(@here())")
    close(file)

    out = read(`julia $script_file`, String)
    print(out)

    @test out == dir
  end
end
