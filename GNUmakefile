SOURCEPDF=dnd5e.pdf
STYLESHEET=dnd5e.xsl
CHARACTER=qa

all: $(CHARACTER).fdf $(CHARACTER).pdf $(CHARACTER).xfdf

clean:

%.fdf: %.pdf
	pdftk $< generate_fdf output $@

%.pdf: %.xfdf
	pdftk $(SOURCEPDF) fill_form $< output $@

%.xfdf: %.xml $(STYLESHEET)
	saxon -s:$< -xsl:$(STYLESHEET) | xmllint --format - > $@
