JULIA := julia


.PHONY: install docs test 

all: install

install:
	$(JULIA) -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate()'

test:
	$(JULIA) --project=. -e 'using Pkg; Pkg.test()'

docs:
	$(JULIA) --project=docs/ -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate()'
	$(JULIA) --project=docs/ docs/make.jl
