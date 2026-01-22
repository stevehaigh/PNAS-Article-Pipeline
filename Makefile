# Makefile for Quarto Dissertation

TARGET = index
OUTDIR = build
DATE := $(shell date +%Y-%m-%d)

PDF_OUT       = thesis-$(DATE).pdf
PDF_PRINT_OUT = thesis-$(DATE)-printing.pdf
DOCX_OUT      = thesis-$(DATE).docx
EPUB_OUT      = thesis-$(DATE).epub

.PHONY: all clean help pdf pdf-print epub docx quarto-watch latex

all: pdf docx epub pdf-print

$(OUTDIR):
	mkdir -p $(OUTDIR)

pdf: $(OUTDIR)
	quarto render $(TARGET).qmd \
		--to pdf \
		--output $(PDF_OUT) \
		--output-dir $(OUTDIR) \
		--no-clean

pdf-print: $(OUTDIR)
	quarto render $(TARGET).qmd \
		--to pdf-print \
		--output $(PDF_PRINT_OUT) \
		--output-dir $(OUTDIR) \
		--no-clean

docx: $(OUTDIR)
	quarto render $(TARGET).qmd \
		--to docx \
		--output $(DOCX_OUT) \
		--output-dir $(OUTDIR) \
		--no-clean

epub: $(OUTDIR)
	quarto render $(TARGET).qmd \
		--to epub \
		--output $(EPUB_OUT) \
		--output-dir $(OUTDIR) \
		--no-clean

# Generate LaTeX files from Quarto (without building PDF)
latex:
	quarto render --to latex

quarto-watch:
	quarto preview

# Clean build artifacts
clean:
	rm -rf $(OUTDIR)/
	rm -f *.html
	# Remove Quarto-generated LaTeX intermediates
	rm -f index.tex index.aux index.log index.out index.toc index.bbl index.bcf index.blg index.run.xml index.synctex.gz
	rm -f index-print.tex index-print.aux index-print.log

# Help target
help:
	@echo "Quarto targets:"
	@echo "  make           - Build all formats (screen PDF, print PDF, EPUB, DOCX) (default)"
	@echo "  make pdf       - Build screen PDF only"
	@echo "  make pdf-print - Build print-optimized PDF (chapters start on odd pages)"
	@echo "  make epub      - Build EPUB only"
	@echo "  make docx      - Build DOCX only"
	@echo "  make latex     - Generate LaTeX files from Quarto (no PDF)"
	@echo "  make quarto-watch - Live preview with Quarto"
	@echo ""
	@echo "Clean targets:"
	@echo "  make clean     - Remove all build artifacts"
	@echo ""
	@echo "  make help      - Show this help message"
