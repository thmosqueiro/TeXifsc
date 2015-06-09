#
# Simple Makefile for LaTeX projects
# Suggestions (pull requests) are welcome!!
# 
# 
# Simple example: suppose you want to compile the file paper.tex, then run
#
# make f=paper
# 
# Remember to drop the file extension (.tex, .aux, etc).
# 
# The 'complete' target means you want a complete cycle of 2
# compilations, one call to bibtex, then two additional
# compilations. Afterwards, clean will also be called. You can define
# how it will be compiled. For instance, to compile with pdflatex:
# 
# make complete m=pdf f=paper
# 
# Old school people usually compile using a combo of latex, dvi2ps and
# ps2pdf. You can achieve that by using oldschool target.
# 
# make oldschool f=paper
# 
# This will compile with pdflatex, then use bibtex, and recompile-it with
# pdflatex. You can also set $f=paper in the beginning of the script if
# you don't wat to keep writing f=paper.
# 
# cc thmosqueiro @ v2014
# https://github.com/thmosqueiro/myscripts
#


f='Tese'


all: pdf pdf bibtex pdf 

complete: clean $m $m bibtex $m $m clean

oldschool: latex latex bibtex latex latex dvi2ps ps2pdf



xela:
	xelatex $(f).tex

latex:
	latex $(f).tex

pdf:
	pdflatex $(f).tex



dvi2ps:
	dvi2ps latex $(f).dvi

ps2pdf:
	ps2pdf latex $(f).ps

bibtex:
	bibtex $(f).aux


qclean:
	rm -v -f *~ *#*#

cleanoutput:
	rm -v -f *~ *.aux *.toc *.log *.out $(f).pdf $(f).ps $(f).dvi

clean:
	rm -v -f *~ *.aux *.toc *.log *.out
