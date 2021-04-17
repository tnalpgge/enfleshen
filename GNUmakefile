SOURCEPDF=dnd5e.pdf
STYLESHEET=dnd5e.xsl
CHARACTER=dnd5e-qa
COMMON_XSL=util.xsl walk.xsl
DND5E_SRC=$(wildcard hectic-horde-stint-affair/dnd5e/*/*_Level*.xml)
DND5E_CHARS=$(DND5E_SRC:.xml=.pdf)

CONAN_SRC=$(wildcard hectic-horde-stint-affair/conan/*/*.xml)
CONAN_CHARS=$(CONAN_SRC:.xml=.xfdf)

PF2E_SRC=$(wildcard hectic-horde-stint-affair/pf2e/*/*_Level*.xml)
PF2E_CHARS=$(PF2E_SRC:.xml=.xfdf)

all: $(CHARACTER).fdf $(CHARACTER).pdf $(CHARACTER).xfdf

clean:
	rm -f $(CHARACTER).fdf $(CHARACTER).pdf $(CHARACTER).xfdf

%.fdf: %.pdf
	pdftk $< generate_fdf output $@

%.pdf: %.xfdf
	pdftk $(SOURCEPDF) fill_form $< output $@

%.xfdf: %.xml $(STYLESHEET)
	saxon -s:$< -xsl:$(STYLESHEET) | xmllint --format - > $@
	#java -jar /usr/share/java/Saxon-HE.jar -s:$< -xsl:$(STYLESHEET) | xmllint --format - > $@

dnd5e: $(DND5E_CHARS)

conan: $(CONAN_CHARS)

pf2e: $(PF2E_CHARS)

dnd5e.xsl: $(COMMON_XSL)

conan.xsl: $(COMMON_XSL)

pf2e.xsl: $(COMMON_XSL)

