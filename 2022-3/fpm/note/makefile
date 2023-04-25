# pdflatex must be executed twice
# This make file is equivalent to the following commands in build.sh
# pdflatex note.tex
# biber note
# pdflatex note.tex

NAME=note

all: note.pdf

note.pdf: note.tex note.bbl
	pdflatex note.tex

note.bbl:
	pdflatex note.tex
	biber note

clean:
	rm -f $(NAME).aux $(NAME).bbl $(NAME).bcf $(NAME).blg $(NAME).log $(NAME).out $(NAME).run.xml $(NAME).toc $(NAME).pdf $(NAME).synctex.gz $(NAME).fdb_latexmk $(NAME).fls
