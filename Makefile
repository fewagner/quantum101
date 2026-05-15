MAIN = main
LATEX = pdflatex
BIBTEX = bibtex
FLAGS = -interaction=nonstopmode -halt-on-error

.PHONY: all clean distclean watch version.tex

all: $(MAIN).pdf

# Regenerate the version stamp on every build from `git describe`.
# Falls back to "dev" outside a git checkout. Marked .PHONY so the
# stamp always reflects the current HEAD even on incremental builds.
version.tex:
	@VERSION=$$(git describe --tags --always --dirty 2>/dev/null || echo dev); \
	  printf '%%%% Auto-generated; do not edit.\n\\def\\docversion{%s}\n' "$$VERSION" > $@; \
	  echo "version.tex -> $$VERSION"

$(MAIN).pdf: $(MAIN).tex preamble.tex version.tex $(wildcard chapters/*.tex) bibliography.bib
	$(LATEX) $(FLAGS) $(MAIN).tex
	-$(BIBTEX) $(MAIN)
	$(LATEX) $(FLAGS) $(MAIN).tex
	$(LATEX) $(FLAGS) $(MAIN).tex

watch:
	latexmk -pdf -pvc -interaction=nonstopmode $(MAIN).tex

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz
	rm -f chapters/*.aux version.tex

distclean: clean
	rm -f $(MAIN).pdf
