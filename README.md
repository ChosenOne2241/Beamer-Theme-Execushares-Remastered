# Beamer-Theme-Execushares-Remastered

The project is inspired by [Better Beamer Themes](https://blog.hamaluik.ca/posts/better-beamer-themes/); compared to the original one, it shares [the same colour palette](https://kuler.adobe.com/userId%3A1738589-art-colors/) with a brand-new visual design and a few extra features:

* A clearer directory structure
* Sticks to pdfLaTeX, rather than XeLaTeX
* Imports BibLaTeX for references instead of BibTeX
* Extracts the colour theme from the style file, making it easier to change
* Uses `\(` and `\)` instead of dollar signs (`$`) to display inline mathematical formulae (whose reason is explained in [the link](https://tex.stackexchange.com/questions/510/are-and-preferable-to-dollar-signs-for-math-mode))
* Enables appendix in Beamer presentations (which is not recommended in the most cases)

Also, we append a short tutorial on creating overlays (`\pause`, `\visible` and `\only`).

Compilation order: run `pdflatex` on `Main.tex` first, then invoke `biber` (instead of `bibtex`), and finally apply `pdflatex` **two more times**.
