# LaTeX Thesis Template

A simple, clean LaTeX template for academic theses and dissertations. This template uses the `book` document class with biblatex for bibliography management, making it compatible with Zotero and other reference managers. GitHub Actions are integrated to automatically compile your PDF on every push.

## GitHub Actions Integration

This repository includes an automated workflow that compiles your LaTeX document whenever you push changes to the main branch.

**What the GitHub Action does:**
- Automatically installs TeX Live (including latexmk and biber)
- Compiles `main.tex` to PDF using latexmk with full biblatex/biber support
- Uploads the compiled PDF as a downloadable artifact (available for 30 days)
- Optionally attaches the PDF to GitHub releases when you create a version tag

**Accessing the compiled PDF:**
- Go to the **Actions** tab in your repository
- Click on the latest workflow run
- Download the PDF artifact from the workflow summary

## Project Structure

- **main.tex** - Main dissertation document
- **chapters/** - Individual chapter files
  - 01_introduction.tex
  - 02_literature_review.tex
  - 03_methodology.tex
  - 04_results.tex
  - 05_discussion.tex
  - 06_conclusion.tex
- **appendices/** - Appendix files
- **figures/** - Images and figures
- **settings/** - LaTeX configuration and preamble
- **references.bib** - Bibliography/references

## Building the Document

**Using latexmk (recommended):**
```bash
latexmk -pdf main.tex
```

**Manual compilation:**
```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

Or use your LaTeX editor's build command. Make sure your editor is configured to use **biber** as the bibliography engine (not bibtex).

## Notes

- Edit the title and author information in `main.tex`
- Add your references to `bibliography/references.bib` in BibTeX format
- Place figures in the `figures/` directory and reference them as shown in the templates
- Each chapter can be edited independently in its respective file
- This template uses biblatex with the APA style - citations work with `\autocite{}`, `\textcite{}`, etc.
- Compatible with Zotero - export your library as BibTeX and use the citation keys
