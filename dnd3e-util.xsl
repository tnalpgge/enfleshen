<xsl:stylesheet
    version="1.0"
    xmlns:xfdf="http://ns.adobe.com/xfdf/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:x="urn:tnalpgge:enfleshen"
    exclude-result-prefixes="xfdf">

  <!-- Utilities for descendants of D&D3e -->

  <xsl:template name="ability-modifier">
    <xsl:param name="score" select="10"/>
    <xsl:value-of select="floor(number($score) div 2) - 5"/>
  </xsl:template>

  <xsl:template name="signed-number">
    <xsl:param name="number"/>
    <xsl:if test="number($number) &gt; 0">
      <xsl:text>+</xsl:text>
    </xsl:if>
    <xsl:value-of select="$number"/>
  </xsl:template>

  <xsl:template name="signed-ability-modifier">
    <xsl:param name="score" select="10"/>
    <xsl:call-template name="signed-number">
      <xsl:with-param name="number">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="explicit-signed-number">
    <xsl:param name="number"/>
    <xsl:if test="number($number) &gt;= 0">
      <xsl:text>+</xsl:text>
    </xsl:if>
    <xsl:value-of select="$number"/>    
  </xsl:template>

  <xsl:template name="implicit-signed-number">
    <xsl:param name="number"/>
    <xsl:choose>
      <xsl:when test="number($number) &gt; 0">
	<xsl:text>+</xsl:text>
	<xsl:value-of select="$number"/>
      </xsl:when>
      <xsl:when test="number($number) &lt; 0">
	<xsl:value-of select="$number"/>
      </xsl:when>
      <xsl:otherwise><!-- silently omit --></xsl:otherwise>
    </xsl:choose>
  </xsl:template>
    

</xsl:stylesheet>
