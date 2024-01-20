using Here
using Test

@testset "Here.jl" begin
  mktempdir() do dir
    # Create a .here file in the temporary directory
    touch(joinpath(dir, ".here"))
    # Change the working directory to the temporary directory
    cd(dir) do
      # Test the iam function
      @test Here.iam() == dir
    end
  end
end
