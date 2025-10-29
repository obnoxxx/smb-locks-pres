
SHELL=/bin/sh

SOURCE=pres.tex
FILES=$(wildcard pres.*)

GENERATED=$(patsubst pres.tex,  , $(FILES))


.SUFFIXES: .tex .pdf

.tex.pdf:
	@pdflatex $<
	@pdflatex $<

.PHONY: info

info:
		@echo generated files: $(GENERATED)

.PHONY: pres
pres: pdf
.PHONY: pdf
pdf: clean pres.pdf



show: pres
	@$(VIEWER) pres.pdf

.PHONY: clean

clean:
	@rm -f $(GENERATED)

