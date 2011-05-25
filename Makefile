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
	glossary.tex\

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
	@$(PDFLATEX) $(NAME)
	@echo
	
	@echo "--- BibTeX"
	@$(BIBTEX) $(NAME)
	@echo
	
	@echo "--- Glossary"
	@makeglossaries $(NAME)
	@echo
	
	@echo "--- Running LaTeX until complete"
	@$(PDFLATEX) $(NAME)
	@$(PDFLATEX) $(NAME)
	@$(PDFLATEX) $(NAME)

clean:
	rm -f `hg st -in`

.PHONY: all pdf clean
