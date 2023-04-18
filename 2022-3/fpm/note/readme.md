## Technical Details

It seems there are some problems on bibtex as to compatibility of mutiple files and reference -- circumvented by including a valid, precompiked `.bbl` file in the directory.

If compilation fails, try `biber main` first before compiling the document with `pdflatex note.tex`.
