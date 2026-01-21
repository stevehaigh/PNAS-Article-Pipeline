# Quarto Dissertation Template

A modern, flexible Quarto-based template for academic theses and dissertations. Write in Markdown, leverage Quarto's powerful features for citations, cross-references, and figures, and compile to multiple formats (PDF, DOCX, EPUB). GitHub Actions automatically build and publish your dissertation on every push.

## Features

- **Multiple Output Formats**: PDF (screen & print), DOCX, EPUB from a single source
- **Screen-Optimized PDF**: Continuous pagination for digital reading (14 pages)
- **Print-Optimized PDF**: Traditional book layout with chapters on odd pages (22 pages)
- **Automated Builds**: GitHub Actions compile all formats on every push
- **LaTeX Export**: Generate editable `.tex` files for fine-grained control
- **Live Preview**: Real-time updates while writing

## GitHub Actions Integration

This repository includes an automated workflow that compiles your dissertation whenever you push changes to the main branch.

**What the GitHub Action does:**
- Automatically installs Quarto and TinyTeX (lightweight TeX distribution)
- Renders all chapter `.qmd` files to PDF, DOCX, and EPUB
- Manages citations automatically using your `bibliography/Dissertation.bib` file
- Uploads all compiled formats as downloadable artifacts (available for 30 days)
- Optionally attaches all formats to GitHub releases when you create a version tag

**Accessing the compiled files:**
- Go to the **Actions** tab in your repository
- Click on the latest workflow run
- Download the PDF, DOCX, or EPUB artifacts from the workflow summary

## Project Structure

- **`index.qmd`** — Frontmatter (title page, abstract)
- **`_quarto.yml`** — Quarto project configuration
- **`chapters/`** — Individual chapter files (`.qmd` Markdown files)
  - `01_introduction.qmd`
  - `02_literature_review.qmd`
  - `03_methodology.qmd`
  - `04_results.qmd`
  - `05_discussion.qmd`
  - `06_conclusion.qmd`
  - `appendix_a.qmd`
- **`figures/`** — Images and figures
- **`bibliography/`** — Bibliography files
  - `Dissertation.bib` — BibTeX format bibliography
- **`build/`** — Output directory for compiled files (created by Makefile)
- **`.vscode/`** — VS Code settings for LaTeX Workshop integration

## Building the Document

**Using the Makefile (recommended):**

Build all formats (PDF screen, PDF print, DOCX, EPUB):
```bash
make
```

Build individual formats:
```bash
make pdf          # Screen-optimized PDF (continuous pages)
make pdf-print    # Print-optimized PDF (chapters on odd pages)
make docx         # Microsoft Word format
make epub         # E-book format
```

Other targets:
```bash
make latex        # Export to LaTeX (.tex files) without building PDF
make quarto-watch # Live preview with auto-reload
make clean        # Remove all build artifacts
make help         # Show all available targets
```

**Output files** are created in the `build/` directory with datestamped filenames:
- `thesis-2026-01-21.pdf` — Screen-optimized PDF
- `thesis-2026-01-21-printing.pdf` — Print-optimized PDF
- `thesis-2026-01-21.docx` — Word document
- `thesis-2026-01-21.epub` — E-book

**Using Quarto directly:**

Build all formats:
```bash
quarto render
```

Live preview:
```bash
quarto preview
```

## Advanced Workflow: Working with LaTeX

If you need fine-grained control over the LaTeX output (e.g., for journal submission or custom formatting), you can export to `.tex` files and edit them directly.

**Export to LaTeX:**
```bash
make latex
```

This creates LaTeX files without compiling to PDF. You can then:
1. Find the generated `.tex` files in the working directory (`index.tex`, `index-print.tex`)
2. Edit the LaTeX directly for precise formatting control
3. Compile manually using your preferred LaTeX toolchain:
   ```bash
   pdflatex index.tex
   biber index
   pdflatex index.tex
   pdflatex index.tex
   ```

**Note**: The LaTeX export is a one-way process. Any edits to `.tex` files will be overwritten the next time you run `make latex`. This workflow is best for final adjustments before submission.

## Editing Content

**Chapters:**
- Edit any `.qmd` file in the `chapters/` directory
- Changes are automatically reflected on the next build
- Use Markdown syntax with embedded math, citations, and figures

**Adding Citations:**
- Add references to `bibliography/Dissertation.bib` in BibTeX format
- Use `[@citationKey]` syntax in your Markdown
- Compatible with Zotero and other reference managers

**Figures:**
- Place images in the `figures/` directory
- Reference with: `![caption](../figures/filename.png){#fig:label}`
- Cross-reference with: `@fig:label`

**Math:**
- Inline: `$E = mc^2$`
- Display with LaTeX labels for cross-references:
  ```latex
  \begin{equation}
  \label{eq:einstein}
  E = mc^2
  \end{equation}
  ```
- Reference with: `\eqref{eq:einstein}`

**Cross-references:**
- Figures: `@fig:label`
- Tables: `@tbl:label`
- Equations: `\eqref{eq:label}` (use LaTeX-style for PDF compatibility)

## Configuration

- **Edit `_quarto.yml`** to change:
  - Dissertation title and author
  - Chapter order
  - PDF formatting (margins, font size, line spacing)
  - Bibliography path
- **PDF formats:**
  - `pdf`: Screen-optimized with `classoption: [oneside, openany]`
  - `pdf-print`: Print-optimized (default book class behavior)

## Resources

- **Quarto documentation** — https://quarto.org/docs/books/
- **Quarto PDF customization** — https://quarto.org/docs/output-formats/pdf-basics.html
- **Citation syntax** — https://quarto.org/docs/authoring/footnotes-and-citations.html
