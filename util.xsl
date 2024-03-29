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
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-before($thing, '-')"/>
    </xsl:call-template>
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-after($thing, '-')"/>
    </xsl:call-template>
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
      <xsl:when test="number($value) &gt;= 1">
	<xsl:text>Yes</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Off</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="acronym-followed-by-word">
    <xsl:param name="thing"/>
    <xsl:value-of select="upper-case(substring-before($thing, '-'))"/>
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-after($thing, '-')"/>
    </xsl:call-template>
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
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-before($thing, '-')"/>
    </xsl:call-template>
    <xsl:value-of select="upper-case(substring-after($thing, '-'))"/>
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

  <xsl:template name="ucfirst3words">
    <xsl:param name="thing"/>
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-before($thing, '-')"/>
    </xsl:call-template>
    <xsl:call-template name="ucfirst2words">
      <xsl:with-param name="thing" select="substring-after($thing, '-')"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="three-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst3words">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="ucfirst4words">
    <xsl:param name="thing"/>
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-before($thing, '-')"/>
    </xsl:call-template>
    <xsl:call-template name="ucfirst3words">
      <xsl:with-param name="thing" select="substring-after($thing, '-')"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="four-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst4words">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="first-two-words">
    <xsl:param name="thing"/>
    <xsl:value-of select="string-join(subsequence(tokenize($thing, '-'), 1, 2),  '-')"/>
  </xsl:template>

  <xsl:template name="two-words-followed-by-acronym">
    <xsl:param name="thing"/>
    <xsl:call-template name="ucfirst2words">
      <xsl:with-param name="thing">
	<xsl:call-template name="first-two-words">
	  <xsl:with-param name="thing" select="$thing"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:value-of select="upper-case(substring-after(substring-after($thing, '-'), '-'))"/>
  </xsl:template>

  <xsl:template name="two-word-acronym-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template name="two-words-followed-by-acronym">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="ucfirst5words">
    <xsl:param name="thing"/>
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-before($thing, '-')"/>
    </xsl:call-template>
    <xsl:call-template name="ucfirst4words">
      <xsl:with-param name="thing" select="substring-after($thing, '-')"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="five-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst5words">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="word-acronym-word">
    <xsl:param name="thing"/>
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-before($thing, '-')"/>
    </xsl:call-template>
    <xsl:value-of select="upper-case(substring-before(substring-after($thing, '-'), '-'))"/>
    <xsl:call-template name="ucfirst">
      <xsl:with-param name="thing" select="substring-after(substring-after($thing, '-'), '-')"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="word-acronym-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template name="word-acronym-word">
	  <xsl:with-param name="thing" select="$name"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="all-caps-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="upper-case($name)"/>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="first-word-field">
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

  <xsl:template name="extract-numbers-from-text">
    <xsl:param name="txt"/>
    <xsl:for-each select="tokenize($txt, '\D+')">
      <xsl:if test="string(number(.)) != 'NaN'">
	<xsl:element name="n" xmlns="urn:tnalpgge:enfleshen">
	  <xsl:value-of select="."/>
	</xsl:element>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="add-extracted-numbers">
    <xsl:param name="nn"/>
    <xsl:value-of select="sum($nn/x:n)"/>
  </xsl:template>

  <xsl:template name="add-scattered-numbers-in-text">
    <xsl:param name="txt"/>
    <xsl:call-template name="add-extracted-numbers">
      <xsl:with-param name="nn">
	<xsl:call-template name="extract-numbers-from-text">
	  <xsl:with-param name="txt" select="$txt"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>

</xsl:stylesheet>
