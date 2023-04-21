# pdflatex must be executed twice
# This make file is equivalent to the following commands in build.sh
# pdflatex note.tex
# biber note
# pdflatex note.tex

all: note.pdf

note.pdf: note.tex note.bbl
	pdflatex note.tex

note.bbl:
	pdflatex note.tex
	biber note
