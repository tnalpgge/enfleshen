<xsl:stylesheet
    version="1.0"
    xmlns:xfdf="http://ns.adobe.com/xfdf/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:x="urn:tnalpgge:enfleshen"
    exclude-result-prefixes="xfdf">

  <xsl:import href="util.xsl"/>
  <xsl:import href="walk.xsl"/>

  <xsl:template match="
    age |
    alignment |
    allies |
    appearance |
    attitude |
    beliefs |
    birthplace |
    catchphrases |
    character/ancestry |
    character/background |
    character/heritage |
    character/level |
    character/traits |
    class |
    deity |
    dislikes |
    enemies |
    ethnicity |
    height |
    likes |
    nationality |
    organizations |
    size |
    speed |
    weight
    ">
    <xsl:call-template name="single-word-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
    character-name |
    gender-pronouns |
    hero-points |
    movement-types |
    player-name
    ">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>    
  </xsl:template>
  

</xsl:stylesheet>
