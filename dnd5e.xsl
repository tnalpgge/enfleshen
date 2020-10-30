<xsl:stylesheet
    version="1.0"
    xmlns:xfdf="http://ns.adobe.com/xfdf/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:x="urn:tnalpgge:enfleshen"
    exclude-result-prefixes="xfdf">

  <x:saving-throws>
    <x:saving-throw ability="strength" proficient="Check Box 11"/>
    <x:saving-throw ability="dexterity" proficient="Check Box 18"/>
    <x:saving-throw ability="constitution" proficient="Check Box 19"/>
    <x:saving-throw ability="intelligence" proficient="Check Box 20"/>
    <x:saving-throw ability="wisdom" proficient="Check Box 21"/>
    <x:saving-throw ability="charisma" proficient="Check Box 22"/>
  </x:saving-throws>

  <x:skills>
    <x:skill name="acrobatics" formfield="Acrobatics" proficient="Check Box 23"/>
    <x:skill name="animal-handling" formfield="Animal" proficient="Check Box 24"/>    
    <x:skill name="arcana" formfield="Arcana" proficient="Check Box 25"/>
    <x:skill name="athletics" formfield="Athletics" proficient="Check Box 26"/>
    <x:skill name="deception" formfield="Deception " proficient="Check Box 27"/>
    <x:skill name="history" formfield="History " proficient="Check Box 28"/>    
    <x:skill name="insight" formfield="Insight" proficient="Check Box 29"/>
    <x:skill name="intimidation" formfield="Intimidation" proficient="Check Box 30"/>
    <x:skill name="investigation" formfield="Investigation " proficient="Check Box 31"/>    
    <x:skill name="medicine" formfield="Medicine" proficient="Check Box 32"/>
    <x:skill name="nature" formfield="Nature" proficient="Check Box 33"/>
    <x:skill name="perception" formfield="Perception " proficient="Check Box 34"/>    
    <x:skill name="performance" formfield="Performance" proficient="Check Box 35"/>
    <x:skill name="persuasion" formfield="Persuasion" proficient="Check Box 36"/>
    <x:skill name="religion" formfield="Religion" proficient="Check Box 37"/>
    <x:skill name="sleight-of-hand" formfield="SleightofHand" proficient="Check Box 38"/>
    <x:skill name="stealth" formfield="Stealth " proficient="Check Box 39"/>
    <x:skill name="survival" formfield="Survival" proficient="Check Box 40"/>
  </x:skills>

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

  <xsl:template name="saving-throw-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="proficient">
      <xsl:text>Off</xsl:text>
    </xsl:param>
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
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:saving-throws/x:saving-throw[@ability=$name]/@proficient"/>
      <xsl:with-param name="value">
	<xsl:call-template name="checkbox">
	  <xsl:with-param name="value" select="$proficient"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="skill-field">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="proficient"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:skills/x:skill[@name=$name]/@formfield"/>
      <xsl:with-param name="value" select="$value"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:skills/x:skill[@name=$name]/@proficient"/>
      <xsl:with-param name="value">
	<xsl:call-template name="checkbox">
	  <xsl:with-param name="value" select="$proficient"/>
	</xsl:call-template>
      </xsl:with-param>
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

  <xsl:template match="age |
		       alignment |
		       allies |
		       background |
		       backstory |
		       bonds |
		       equipment |
		       eyes |
		       flaws |
		       hair |
		       height |
		       ideals |
		       initiative |
		       inspiration |
		       passive |
		       skin |
		       speed |
		       treasure |
		       weight 
		       ">
    <xsl:call-template name="single-word-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="race">
    <xsl:call-template name="single-word-space-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
      <xsl:with-param name="spaces">
	<xsl:text> </xsl:text>
      </xsl:with-param>
    </xsl:call-template>    
  </xsl:template>

  <xsl:template match="totallybogus">
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
		       player-name |
		       prof-bonus |
		       proficiencies-lang
		       ">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="character-name">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:text>CharacterName 2</xsl:text>
      </xsl:with-param>
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
  
  <xsl:template match="abilities">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="abilities/constitution |
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

  <xsl:template match="abilities/charisma">
    <xsl:call-template name="all-caps-field">
      <xsl:with-param name="name" select="substring(name(), 1, 3)"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:text>CHamod</xsl:text>
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
      <xsl:with-param name="proficient" select="@proficient"/>
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

  <xsl:template match="personality-traits">
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:text>PersonalityTraits </xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="features-and-traits">
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:text>Features and Traits</xsl:text> <!-- first page -->
      </xsl:with-param>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="add-features-traits">
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:text>Feat+Traits</xsl:text> <!-- second page -->
      </xsl:with-param>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>    
  </xsl:template>

  <xsl:template match="skills">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="skills/*">
    <xsl:call-template name="skill-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value" select="text()"/>
      <xsl:with-param name="proficient" select="@proficient"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
