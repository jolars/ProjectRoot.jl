JULIA := julia

all: docs

.PHONY: docs
docs:
	cd docs ;\
	$(JULIA) --project make.jl
