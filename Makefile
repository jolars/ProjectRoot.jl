JULIA := julia

all: docs

.PHONY: docs
docs:
	$(JULIA) --project=docs/ -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate()'
	$(JULIA) --project=docs/ docs/make.jl
