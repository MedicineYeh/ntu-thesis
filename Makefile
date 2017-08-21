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

TEXFLAG+="\input{$(MAIN)} "

watermark.pdf:
	wget $(NTU_WATERMARK_LINK) -O watermark.pdf

$(MAIN).pdf: chapters/*.tex figures/* *.tex ntuthesis.cls watermark.pdf
	$(LATEX) -shell-escape $(TEXFLAG) $(MAIN) < /dev/null
	$(BIBTEX) $(MAIN)
	$(LATEX) -shell-escape $(TEXFLAG) $(MAIN) < /dev/null
	$(LATEX) -shell-escape $(TEXFLAG) $(MAIN) < /dev/null

ifdef PASSWORD
$(MAIN)-with-pass.pdf: $(MAIN).pdf
	@pdftk $^ output $@ owner_pw "$(PASSWORD)" allow printing allow ScreenReaders
endif

update: chapters/*.tex figures/* *.tex ntuthesis.cls watermark.pdf
	$(LATEX) -shell-escape $(TEXFLAG) $(MAIN) < /dev/null
	$(BIBTEX) $(MAIN)

clean:
	rm -f $(CLEANABLE) $(MAIN).pdf
	rm -rf _minted-*

