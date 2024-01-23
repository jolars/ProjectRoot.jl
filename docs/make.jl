using Documenter
using ProjectRoot

# Copy CHANGELOG.md to docs/src/CHANGELOG.md
cp(
  joinpath(@__DIR__, "../CHANGELOG.md"),
  joinpath(@__DIR__, "src/CHANGELOG.md");
  force=true
)

makedocs(
  sitename="ProjectRoot",
  format=Documenter.HTML(
    assets=["assets/favicon.ico"],
  ),
  modules=[ProjectRoot],
  pages=[
    "Home" => "index.md",
    "API Reference" => "api.md",
    "Changelog" => "CHANGELOG.md",
  ]
)

deploydocs(
  repo="https://github.com/jolars/ProjectRoot.jl.git"
)

