using Documenter
using ProjectRoot

makedocs(
  sitename="ProjectRoot",
  format=Documenter.HTML(),
  modules=[ProjectRoot],
  pages=[
    "Home" => "index.md",
    "API Reference" => "api.md"
  ]
)

deploydocs(
  repo="https://github.com/jolars/ProjectRoot.jl.git"
)

