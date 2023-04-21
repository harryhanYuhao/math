#!/bin/sh

pdflatex note.tex
biber note
pdflatex note.tex
