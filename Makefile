# Make File for Ross Light's Term Paper
# Written by Ross Light based on a Makefile by Nat Welch
#
# Targets:
#
#   pdf      --- builds the pdf version of the document
#   clean --- cleans up everything that can be regenerated

NAME=termpaper

TEXFILES=\
	$(NAME).tex\

BIBFILES=\
	$(NAME).bib\

# Programs
PDFLATEX  = pdflatex
BIBTEX    = bibtex

# Targets
all: pdf

pdf: $(NAME).pdf

%.pdf: $(TEXFILES) $(BIBFILES)
	@echo "--- LaTeX"
	@$(PDFLATEX) $(TEXFILES)
	@echo
	
	@echo "--- BibTeX"
	@$(BIBTEX) $(NAME)
	@echo
	
	@echo "--- Running LaTeX until complete"
	@$(PDFLATEX) $(TEXFILES)
	@$(PDFLATEX) $(TEXFILES)
	@$(PDFLATEX) $(TEXFILES)

clean:
	rm -f $(NAME).pdf $(NAME).log $(NAME).aux *.bbl *.blg *.out *.toc $(NAME).synctex.gz

.PHONY: all pdf clean
