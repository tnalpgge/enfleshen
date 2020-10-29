SOURCEPDF=dnd5e.pdf
STYLESHEET=dnd5e.xsl

all: 

%.pdf: %.xfdf
	pdftk $(SOURCEPDF) fill_form $< output $@

%.xfdf: %.xml $(STYLESHEET)
	saxon -s:$< -xsl:$(STYLESHEET) | xmllint --format - > $@
