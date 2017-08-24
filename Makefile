MAIN=thesis
LATEX=xelatex
BIBTEX=bibtex
NTU_WATERMARK_LINK=http://etds.lib.ntu.edu.tw/files/watermark.pdf
CLEANABLE=*.aux *.log *.nav *.dvi *.out *.snm *.toc *.bbl *.blg *.lof *.lot *.spl *.lof *.lot

ifdef PASSWORD
all: $(MAIN).pdf $(MAIN)-with-pass.pdf
else
all: $(MAIN).pdf
endif

TEXFLAG+=-halt-on-error
TEXFLAG+=-shell-escape

watermark.pdf:
	wget $(NTU_WATERMARK_LINK) -O watermark.pdf

$(MAIN).pdf: chapters/*.tex figures/* *.tex ntuthesis.cls watermark.pdf
	pdflatex $(TEXFLAG) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(TEXFLAG) $(MAIN).tex
	$(LATEX) $(TEXFLAG) $(MAIN).tex

ifdef PASSWORD
$(MAIN)-with-pass.pdf: $(MAIN).pdf
	@pdftk $^ output $@ owner_pw "$(PASSWORD)" allow printing allow ScreenReaders
endif

update: chapters/*.tex figures/* *.tex ntuthesis.cls watermark.pdf
	$(LATEX) $(TEXFLAG) $(MAIN).tex
	$(BIBTEX) $(MAIN)

fast: chapters/*.tex figures/* *.tex ntuthesis.cls watermark.pdf
	pdflatex $(TEXFLAG) $(MAIN).tex
	$(BIBTEX) $(MAIN)

clean:
	rm -f $(CLEANABLE) $(MAIN).pdf $(MAIN)-with-pass.pdf
	rm -rf _minted-*

