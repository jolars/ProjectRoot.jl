using Documenter
using Here

makedocs(
  sitename = "Here",
  format = Documenter.HTML(),
  modules = [Here],
  pages = [
    "Home" => "index.md",
    "API Reference" => "api.md"
  ]
)

deploydocs(
  repo = "https://github.com/jolars/Here.jl.git"
)

