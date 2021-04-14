<xsl:stylesheet
    version="1.0"
    xmlns:xfdf="http://ns.adobe.com/xfdf/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:x="urn:tnalpgge:enfleshen"
    exclude-result-prefixes="xfdf">
  
  <!-- Walk the document and produce the output -->

  <xsl:template match="node()|comment()">
    <!-- silently omit anything that we do not specifically match -->
  </xsl:template>

  <xsl:template match="/character">
    <xsl:element name="xfdf" namespace="http://ns.adobe.com/xfdf/">
      <xsl:attribute name="xml:space">
	<xsl:text>preserve</xsl:text>
      </xsl:attribute>
      <xsl:element name="fields" namespace="http://ns.adobe.com/xfdf/">
	<xsl:apply-templates/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
