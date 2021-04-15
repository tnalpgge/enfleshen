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

  <x:abilities>
    <x:ability name="strength">
      <x:skill name="athletics"/>
    </x:ability>
    <x:ability name="dexterity">
      <x:skill name="acrobatics"/>
      <x:skill name="stealth"/>
      <x:skill name="thievery"/>
      <x:saving-throw name="reflex"/>
    </x:ability>
    <x:ability name="constitution">
      <x:saving-throw name="fortitude"/>
    </x:ability>
    <x:ability name="intelligence">
      <x:skill name="arcana"/>
      <x:skill name="crafting"/>
      <x:skill name="lore"/>
      <x:skill name="occultism"/>
      <x:skill name="society"/>
    </x:ability>
    <x:ability name="wisdom">
      <x:skill name="medicine"/>
      <x:skill name="nature"/>
      <x:skill name="religion"/>
      <x:skill name="survival"/>
      <x:saving-throw name="will"/>
    </x:ability>
    <x:ability name="charisma">
      <x:skill name="deception"/>
      <x:skill name="diplomacy"/>
      <x:skill name="intimidation"/>
      <x:skill name="performance"/>
    </x:ability>
  </x:abilities>

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

  <xsl:template name="ability-modifier">
    <xsl:param name="score"/>
    <xsl:value-of select="floor($score div 2) - 5"/>
  </xsl:template>

  <xsl:template name="ability">
    <xsl:param name="name"/>
    <xsl:param name="score"/>
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat($name, '-score')"/>
      <xsl:with-param name="value" select="$score"/>
    </xsl:call-template>
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat($name, '-modifier')"/>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:for-each select="document('')//x:abilities/x:ability[@name=$name]/x:skill">
      <xsl:call-template name="skill-modifier">
	<xsl:with-param name="skill" select="@name"/>
	<xsl:with-param name="score" select="$score"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="abilities">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="abilities/strength">
    <xsl:call-template name="ability">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="score" select="number(text())"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
