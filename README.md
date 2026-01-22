# PNAS Article Template

A Quarto-based template for drafting PNAS (Proceedings of the National
Academy of Sciences) article submissions. Write in Markdown with full support
for citations, cross-references, and figures, then export to the official PNAS
LaTeX template for final submission.

## Features

- **PNAS-Inspired Structure**: Matches PNAS article organization and
  requirements
- **Two-Column PDF**: Mimics PNAS journal layout for preview
- **Multiple Formats**: PDF, DOCX, and HTML from single source
- **Supporting Information**: Separate SI Appendix template included
- **Automated Builds**: GitHub Actions compiles on every push
- **LaTeX Export**: Generate `.tex` files for final PNAS submission

## Quick Start

Build article PDF and Supporting Information:

```bash
make
```

This creates datestamped files in `build/`:

- `article-2026-01-22.pdf`
- `si-appendix-2026-01-22.pdf`

Individual outputs:

```bash
make pdf     # Article PDF
make docx    # Word document  
make html    # HTML version
make si      # Supporting Information PDF
make latex   # Generate .tex source
```

Live preview:

```bash
make watch   # or: quarto preview article.qmd
```

## Project Structure

- **`article.qmd`**: Main article with PNAS-required sections
- **`si-appendix.qmd`**: Supporting Information template
- **`_quarto.yml`**: Project configuration
- **`figures/`**: Images and figures
- **`bibliography/references.bib`**: Bibliography in BibTeX format
- **`build/`**: Output directory

## PNAS Article Requirements

### Required Elements

- **Title & Authors**: With affiliations and ORCID IDs
- **Abstract**: ≤250 words
- **Significance Statement**: 50-120 words
- **Keywords**: 3-5 keywords
- **Main Text**: Introduction (no heading), Results, Discussion
- **Materials and Methods**: At end
- **Data Availability**: Required
- **Acknowledgments**: Funding and contributions

### Length Limits

- **Research Article**: ~6 pages (4,000 words, 50 refs)
- **PNAS PLUS**: Up to 12 pages
- **Brief Report**: 3 pages (1,600 words, 15 refs)

## Writing Content

### Citations

Add to `bibliography/references.bib` and cite with `[@citationKey]`

### Figures

```markdown
![Caption.](figures/my-figure.png){#fig-label width=80%}
```

Reference: `@fig-label`

### Tables

```markdown
| Param | Value |
|-------|-------|
| A | 1.23 |

: Caption. {#tbl-label}
```

## GitHub Actions

Automated workflow compiles article and SI on every push:

1. Installs Quarto and TinyTeX
2. Builds PDF, DOCX, and SI outputs  
3. Uploads artifacts (available 30 days)

**Download files**: Actions tab → Latest run → Download artifacts

## Exporting to PNAS LaTeX Template

For final submission:

1. Generate LaTeX: `make latex`
2. Download [PNAS Overleaf
   template](https://www.overleaf.com/latex/templates/pnas-template-for-submissions/yhgffqkncjjh)
3. Transfer content from `article.tex` to PNAS template
4. Compile with official `pnas-new.cls`

**Note**: This template approximates PNAS layout for drafting. Use official
PNAS template for submission.

## Resources

- [PNAS Author Center](https://www.pnas.org/author-center)
- [PNAS Submission
  Guidelines](https://www.pnas.org/author-center/submitting-your-manuscript)
- [PNAS LaTeX
  Template](https://www.overleaf.com/latex/templates/pnas-template-for-submissions/yhgffqkncjjh)
- [Quarto Documentation](https://quarto.org/docs/authoring/)
- [Quarto
  Citations](https://quarto.org/docs/authoring/footnotes-and-citations.html)


