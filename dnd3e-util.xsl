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

  <xsl:template name="signed-ability-modifier">
    <xsl:param name="score" select="10"/>
    <xsl:if test="number($score) &gt; 11">
      <xsl:text>+</xsl:text>
    </xsl:if>
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$score"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
