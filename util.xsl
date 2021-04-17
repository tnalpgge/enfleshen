<xsl:stylesheet
    version="1.0"
    xmlns:xfdf="http://ns.adobe.com/xfdf/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:x="urn:tnalpgge:enfleshen"
    exclude-result-prefixes="xfdf">

  <!-- Common templates used to fill form fields -->

  <xsl:template name="field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:text>&#xa;</xsl:text>
    <xsl:element name="field" namespace="http://ns.adobe.com/xfdf/">
      <xsl:attribute name="name">
	<xsl:value-of select="$name"/>
      </xsl:attribute>
      <xsl:element name="value" namespace="http://ns.adobe.com/xfdf/">
	<xsl:value-of select="$value"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ucfirst">
    <xsl:param name="thing"/>
    <xsl:value-of select="
concat(
  upper-case(
    substring($thing, 1, 1)
  ), 
  lower-case(
    substring($thing, 2)
  )
)"/>
  </xsl:template>

  <xsl:template name="single-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="ucfirst2words">
    <xsl:param name="thing"/>
    <xsl:value-of select="
concat(
  upper-case(
    substring($thing, 1, 1)
  ),
  lower-case(
    substring-before(
      substring($thing, 2),
      '-'
    )
  ),
  upper-case(
    substring(
     substring-after($thing, '-'),
     1,
     1
    )
  ),
  lower-case(
    substring(
      substring-after($thing, '-'),
      2
    )
  )
)"/>
  </xsl:template>

  <xsl:template name="two-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="checkbox">
    <xsl:param name="value"/>
    <xsl:choose>
      <xsl:when test="lower-case($value) = 'on'">
	<xsl:text>Yes</xsl:text>
      </xsl:when>
      <xsl:when test="lower-case($value) = 'true'">
	<xsl:text>Yes</xsl:text>
      </xsl:when>
      <xsl:when test="lower-case($value) = 'yes'">
	<xsl:text>Yes</xsl:text>
      </xsl:when>
      <xsl:when test="number($value) >= 1">
	<xsl:text>Yes</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Off</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="acronym-followed-by-word">
    <xsl:param name="thing"/>
    <xsl:value-of select="
concat(
  upper-case(
    substring-before($thing, '-')
  ),
  upper-case(
    substring(
      substring-after($thing, '-'),
      1,
      1
    )
  ),
  lower-case(
    substring(
      substring-after($thing, '-'),
      2
    )
  )
)
"/>
  </xsl:template>

  <xsl:template name="acronym-with-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template  name="acronym-followed-by-word">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="word-followed-by-acronym">
    <xsl:param name="thing"/>
    <xsl:value-of select="
concat(
  upper-case(
    substring($thing, 1, 1)
  ),
  lower-case(
    substring(
      substring-before($thing, '-'),
      2
    )
  ),
  upper-case(
    substring-after($thing, '-')
  )
)
"/>
  </xsl:template>  

  <xsl:template name="word-with-acronym-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template  name="word-followed-by-acronym">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>    
  </xsl:template>  

</xsl:stylesheet>
