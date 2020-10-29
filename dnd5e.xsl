<xsl:stylesheet
    version="1.0"
    xmlns:xfdf="http://ns.adobe.com/xfdf/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xfdf">

  <xsl:template name="field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:element name="field" namespace="http://ns.adobe.com/xfdf/">
      <xsl:attribute name="name">
	<xsl:value-of select="$name"/>
      </xsl:attribute>
      <xsl:element name="value" namespace="http://ns.adobe.com/xfdf/">
	<xsl:value-of select="$value"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="ability-modifier">
    <xsl:param name="score" select="10"/>
    <xsl:if test="number($score) &gt; 11">
      <xsl:text>+</xsl:text>
    </xsl:if>
    <xsl:value-of select="floor(number($score) div 2) - 5"/>    
  </xsl:template>

  <xsl:template name="ability-modifier-field">
    <xsl:param name="name"/>
    <xsl:param name="score" select="10"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat(upper-case($name), 'mod')"/>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="single-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat(upper-case(substring($name, 1, 1)), lower-case(substring($name, 2)))"/>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="two-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="
concat(
  upper-case(
    substring($name, 1, 1)
  ),
  lower-case(
    substring-before(
      substring($name, 2),
      '-'
    )
  ),
  upper-case(
    substring(
     substring-after($name, '-'),
     1,
     1
    )
  ),
  lower-case(
    substring(
      substring-after($name, '-'),
      2
    )
  )
)"/>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="single-word-space-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="spaces"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat(
upper-case(
  substring($name, 1, 1)
),
lower-case(
  substring($name, 2)
), 
$spaces)"/>
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
      <xsl:with-param name="name" select="concat(
upper-case(
  substring($name, 1, 1)
),
lower-case(
  substring-before(
    substring($name, 2), 
    '-'
  )
))"/>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>    
  </xsl:template>

  <xsl:template name="saving-throw-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat(
'ST ',
upper-case(
  substring($name, 1, 1)
),
lower-case(
  substring($name, 2)
)
)"/>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="acronym-with-word-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat(
upper-case(
  substring-before($name, '-')
),
upper-case(
  substring(
    substring-after($name, '-'),
    1,
    1
  )
),
lower-case(
  substring(
    substring-after($name, '-'),
    2
  )
)
)"/>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="node()|comment()">
    <!-- silently omit -->
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

  <xsl:template match="attacks">
    <xsl:comment>
      <xsl:text> attacks TBD </xsl:text>
    </xsl:comment>
  </xsl:template>

  <xsl:template match="acrobatics |
		       age |
		       alignment |
		       arcana |
		       athletics |
		       background |
		       backstory |
		       bonds |
		       deception |
		       equipment |
		       eyes |
		       flaws |
		       hair |
		       height |
		       ideals |
		       initiative |
		       insight |
		       intimidation |
		       investigation |
		       inspiration |
		       medicine |
		       nature |
		       passive |
		       performance |
		       persuasion |
		       religion |
		       skin |
		       speed |
		       survival |
		       treasure |
		       weight 
		       ">
    <xsl:call-template name="single-word-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="perception |
		       race |
		       stealth">
    <xsl:call-template name="single-word-space-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
      <xsl:with-param name="spaces">
	<xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>

  <xsl:template match="history">
    <xsl:call-template name="single-word-space-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
      <xsl:with-param name="spaces">
	<xsl:text>  </xsl:text>
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>  

  <xsl:template match="character-name |
		       class-level |
		       faction-name |
		       personality-traits |
		       player-name |
		       prof-bonus |
		       proficiencies-lang
		       ">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="ac |
		       cp |
		       ep |
		       gp |
		       hd |
		       pp |
		       sp |
		       xp">
    <xsl:call-template name="all-caps-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template match="animal-handling">
    <xsl:call-template name="first-word-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>      
    </xsl:call-template>
  </xsl:template>    

  <xsl:template match="abilities">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="abilities/charisma |
		       abilities/constitution |
		       abilities/intelligence |
		       abilities/strength | 
		       abilities/wisdom">
    <xsl:call-template name="all-caps-field">
      <xsl:with-param name="name" select="substring(name(), 1, 3)"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
    <xsl:call-template name="ability-modifier-field">
      <xsl:with-param name="name" select="substring(name(), 1, 3)"/>
      <xsl:with-param name="score" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="abilities/dexterity">
    <xsl:call-template name="all-caps-field">
      <xsl:with-param name="name" select="substring(name(), 1, 3)"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:text>DEXmod </xsl:text> <!-- not a typo -->
      </xsl:with-param>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="text()"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="saving-throws">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="saving-throws/*">
    <xsl:call-template name="saving-throw-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="hd-total |
		       hp-current | 
		       hp-max | 
		       hp-temp">
    <xsl:call-template name="acronym-with-word-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>
		

</xsl:stylesheet>
