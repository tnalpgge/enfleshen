# enfleshen

Fill a PDF form non-interactively offline.

# Prerequisites

- [GNU Make](https://www.gnu.org/software/make/)
- [Saxon HE](https://saxon.sourceforge.net/)
- [pdftk-java](https://gitlab.com/pdftk-java/pdftk)
- xmllint from [libxml2](http://xmlsoft.org/)

# Usage

```sh
make ${character}.pdf
```

# Testing

```sh
make qa.xfdf qa.pdf
```

# Motivation

macOS Preview.app can fill forms in PDFs.  It also crashes way more
than it should, typically in the middle of typing.

# Use cases

D&D 5th Edition character sheet.  Acquire the
_Fifth Edition Character Sheets_
from [the official site] and use the three-page model.

[the official site]: https://dnd.wizards.com/products/tabletop-games/trpg-resources/trpg-resources

## Other use cases

Acquire a form-fillable PDF as `source.pdf`.

```
pdftk source.pdf generate_fdf output target.fdf
```

Research what the listed form fields do in `target.fdf`.  May require
experimentation.

Write an XSL stylesheet that creates valid XFDF from a source XML
document.

```
make ${output}.pdf STYLESHEET=stylesheet.xsl SOURCEPDF=source.pdf
```

# License 

[GNU General Public License v3.0](LICENSE.txt)
