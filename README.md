# Quarto Dissertation Template

A comprehensive Quarto-based template for academic theses and dissertations.
Write in Markdown with full support for citations, cross-references, and
figures. Compile to multiple output formats from a single source.

## Features

- **Multiple Output Formats**: PDF (screen & print), DOCX, and EPUB from one
  source
- **Screen-Optimized PDF**: Single-sided layout with continuous pagination for
  digital reading
- **Print-Optimized PDF**: Traditional two-sided book layout with chapters on
  odd pages
- **Automated Builds**: GitHub Actions compiles all formats on every push
- **LaTeX Export**: Generate `.tex` files for fine-grained control
- **Live Preview**: Real-time updates while writing with `quarto preview`

## Quick Start

Build all formats:

```bash
make
```

This creates datestamped files in `build/`:

- `thesis-2026-01-22.pdf` (screen-optimized)
- `thesis-2026-01-22-printing.pdf` (print-optimized)
- `thesis-2026-01-22.docx`
- `thesis-2026-01-22.epub`

Individual formats:

```bash
make pdf        # Screen-optimized PDF
make pdf-print  # Print-optimized PDF
make docx       # Word document
make epub       # EPUB e-book
make latex      # Generate .tex files without compiling
```

Live preview:

```bash
make quarto-watch  # or: quarto preview
```


## Project Structure

- **`index.qmd`**: Title page and abstract
- **`_quarto.yml`**: Project configuration
- **`chapters/`**: Chapter files in Markdown (`.qmd`)
  - `01_introduction.qmd` through `06_conclusion.qmd`
  - `07_references.qmd` — Bibliography (placed between Conclusion and
    Appendices)
- **`appendices/`**: Appendix files
  - `appendix_a.qmd`
- **`figures/`**: Images and figures
- **`bibliography/`**: Bibliography file (`references.bib`)
- **`settings/`**: LaTeX customization (`preamble.tex`)
- **`build/`**: Output directory (created by Makefile)

## GitHub Actions

The repository includes automated CI/CD that compiles all formats when you push
to `main`:

1. Installs Quarto and TinyTeX
2. Builds PDF, DOCX, and EPUB outputs
3. Uploads artifacts (available for 30 days)
4. Optionally attaches outputs to GitHub releases

**To download compiled files:**

1. Go to the **Actions** tab
2. Click the latest workflow run
3. Download artifacts from the workflow summary

## Editing Content

**Chapters**: Edit `.qmd` files in `chapters/`. Use Markdown with embedded
LaTeX math, citations, and cross-references.

**Citations**: Add entries to `bibliography/references.bib` in BibTeX format.
Reference with `[@citationKey]`. The bibliography appears automatically in the
References chapter.

**Figures**:

```markdown
![Caption text](../figures/my-figure.png){#fig-label}
```

Cross-reference with `@fig-label`.

**Math**:

- Inline: `$E = mc^2$`
- Display: Use LaTeX equation environments with labels for cross-references

**Tables**: Use Markdown tables or Quarto's table syntax. Label with
`{#tbl-label}` and reference with `@tbl-label`.

## Advanced: LaTeX Export

For fine-grained control (e.g., journal submission requirements):

```bash
make latex
```

This generates `.tex` files without compiling. You can then edit the LaTeX
directly and compile manually:

```bash
pdflatex index.tex
biber index
pdflatex index.tex
pdflatex index.tex
```

**Note**: LaTeX export is one-way. Changes to `.tex` files are overwritten on
the next `make latex`.

## Configuration

Edit `_quarto.yml` to customize:

- Title, author, and metadata
- Chapter order
- PDF formatting (margins, font size, line spacing)
- Bibliography settings
- Output formats

**PDF variants:**

- `pdf`: Screen-optimized with `classoption: [oneside, openany]`
- `pdf-print`: Print-optimized (default book class)

## Resources

- [Quarto Books](https://quarto.org/docs/books/)
- [PDF Customization](https://quarto.org/docs/output-formats/pdf-basics.html)
- [Citations](https://quarto.org/docs/authoring/footnotes-and-citations.html)

