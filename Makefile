# Makefile for PNAS Article

ARTICLE = article
SI = si-appendix
OUTDIR = build
DATE := $(shell date +%Y-%m-%d)

ARTICLE_PDF = article-$(DATE).pdf
ARTICLE_DOCX = article-$(DATE).docx
ARTICLE_HTML = article-$(DATE).html
SI_PDF = si-appendix-$(DATE).pdf

.PHONY: all clean cleanall help pdf docx html si watch latex

all: pdf si

$(OUTDIR):
	mkdir -p $(OUTDIR)

pdf: $(OUTDIR)
	quarto render $(ARTICLE).qmd --to pdf --output $(ARTICLE_PDF) --output-dir $(OUTDIR)

docx: $(OUTDIR)
	quarto render $(ARTICLE).qmd --to docx --output $(ARTICLE_DOCX) --output-dir $(OUTDIR)

html: $(OUTDIR)
	quarto render $(ARTICLE).qmd --to html --output $(ARTICLE_HTML) --output-dir $(OUTDIR)

si: $(OUTDIR)
	quarto render $(SI).qmd --to pdf --output $(SI_PDF) --output-dir $(OUTDIR)

latex:
	quarto render $(ARTICLE).qmd --to latex

watch:
	quarto preview $(ARTICLE).qmd

quarto-watch: watch

clean:
	rm -rf $(OUTDIR)
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot
	rm -f *.fdb_latexmk *.fls *.synctex.gz

cleanall: clean
	rm -f *.tex *.pdf *.docx *.html

help:
	@echo "Available targets:"
	@echo "  all          - Build article PDF and SI (default)"
	@echo "  pdf          - Build article PDF"
	@echo "  docx         - Build article DOCX"
	@echo "  html         - Build article HTML"
	@echo "  si           - Build Supporting Information PDF"
	@echo "  latex        - Generate LaTeX source from Quarto"
	@echo "  watch        - Live preview with auto-reload"
	@echo "  clean        - Remove build artifacts"
	@echo "  cleanall     - Remove all generated files"
	@echo "  help         - Show this help message"
