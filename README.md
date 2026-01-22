# Quarto Dissertation Template

This repository provides a comprehensive and adaptable Quarto-based template
designed specifically for academic theses and dissertations. It facilitates
authoring in Markdown while leveraging Quarto's advanced capabilities for
managing citations, cross-references, and figures. The template supports
compilation into multiple formats for diverse dissemination requirements.

## Features

The template is equipped with several notable features:

- **Multi-format Output**: Generate outputs in PDF (screen or print), DOCX,
  and EPUB from a single source.
- **1 Sided, Screen-Optimized PDF**: Continuous pagination layout for ease of digital
  reading and single-sided printing.
- **2 Sided Print-Optimized PDF**: Traditional layout with chapters beginning on odd
  pages.
- **Automated Build Process**: Utilizes GitHub Actions to compile all formats
  upon each repository update.
- **LaTeX Export Functionality**: Produces `.tex` files for those who require
  fine-grained customization control.
- **Real-Time Preview**: Allows for live updates and previews during the
  writing process.

## Integration with GitHub Actions

An integrated GitHub Actions workflow ensures seamless and automated
compilation whenever modifications are pushed to the repository's `main`
branch.

### Workflow Specifications

- Installs Quarto and TinyTeX (a lightweight TeX environment).
- Renders chapters into diverse output formats (PDF, DOCX, EPUB).
- Ensures seamless citation management through the
  `bibliography/Dissertation.bib`.
- Provides downloadable output files, accessible from the Actions workflow for
  up to 30 days.
- Optionally, associates compiled files with GitHub release tags.

### Access Instructions

- Navigate to the **Actions** tab of the repository.
- Select the desired workflow run.
- Download compiled outputs (e.g., PDF, DOCX, EPUB) directly from the
  provided links.

## Repository Structure

The project is organized for clarity and convenience:

- **`index.qmd`**: Contains front matter, including the title page and
  abstract.
- **`_quarto.yml`**: Houses the project's configuration settings.
- **`chapters/`**: Contains Markdown-formatted files for each chapter.
- **`figures/`**: A repository for images and figures referenced in the
  document.
- **`bibliography/`**: Stores references in the BibTeX format.
- **`build/`**: Outputs directory for compiled files, created
  programmatically.
- **`.vscode/`**: Specific settings for VS Code integration, particularly with
  LaTeX Workshop.

## Document Compilation

### Using the Makefile

To expedite the compilation process, a `Makefile` provides predefined commands.


1. Compile all formats:

   ```bash
   make
   ```

2. Compile specific formats:

   ```bash
   make pdf        # Continuous-page PDF
   make pdf-print  # Book-style PDF
   make docx       # DOCX format
   make epub       # EPUB format
   ```

### Using Quarto Directly

1. Render all formats:

   ```bash
   quarto render
   ```

2. Preview updates live:

   ```bash
   quarto preview
   ```

## Working with LaTeX

For those requiring enhanced LaTeX manipulation:

1. Export `.tex` files:

   ```bash
   make latex
   ```

2. After export, perform manual LaTeX adjustments and compile using:

   ```bash
   pdflatex index.tex
   ```

Note: Subsequent updates will overwrite `.tex` files.

## Content Customization

1. **Chapters**: Edit source Markdown files (`.qmd`) inside `chapters/`.
2. **Citations**: Manage bibliographic entries with BibTeX format in `bibliography/`.
3. **Figures & Tables**: Store visuals in `figures/` and use Quarto's cross-referencing.
4. **Equations**: Incorporate mathematical notation as inline or block elements.

## Configuration

Modify `_quarto.yml` to:

- Update metadata (title, author, etc.).
- Set chapter order and formatting specifications.
- Adjust bibliography paths.

## Resources and References

- [Quarto Documentation](https://quarto.org/docs/books/)
- [Quarto PDF Guides](https://quarto.org/docs/output-formats/pdf-basics.html)
- [Citation Syntax](https://quarto.org/docs/authoring/footnotes-and-citations.html)
