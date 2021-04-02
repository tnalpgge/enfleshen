SOURCEPDF=dnd5e.pdf
STYLESHEET=dnd5e.xsl
CHARACTER=qa
DND5E_SRC=$(wildcard hectic-horde-stint-affair/dnd5e/*/*_Level*.xml)
DND5E_CHARS=$(DND5E_SRC:.xml=.pdf)

all: $(CHARACTER).fdf $(CHARACTER).pdf $(CHARACTER).xfdf

clean:
	rm -f $(CHARACTER).fdf $(CHARACTER).pdf $(CHARACTER).xfdf

%.fdf: %.pdf
	pdftk $< generate_fdf output $@

%.pdf: %.xfdf
	pdftk $(SOURCEPDF) fill_form $< output $@

%.xfdf: %.xml $(STYLESHEET)
	saxon -s:$< -xsl:$(STYLESHEET) | xmllint --format - > $@

dnd5e: $(DND5E_CHARS)
