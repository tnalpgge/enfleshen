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

  <x:spells>
    <x:ability formfield="SpellcastingAbility 2"/>
    <x:attack-bonus formfield="SpellAtkBonus 2"/>
    <x:class formfield="Spellcasting Class 2"/>
    <x:save-dc formfield="SpellSaveDC  2"/>
    <x:level number="0" index="1" formfield="Spells 1014"/>
    <x:level number="0" index="2" formfield="Spells 1016"/>
    <x:level number="0" index="3" formfield="Spells 1017"/>
    <x:level number="0" index="4" formfield="Spells 1018"/>
    <x:level number="0" index="5" formfield="Spells 1019"/>
    <x:level number="0" index="6" formfield="Spells 1020"/>
    <x:level number="0" index="7" formfield="Spells 1021"/>
    <x:level number="0" index="8" formfield="Spells 1022"/>

    <!-- Ugh, make up your mind.  expended vs. remaining? -->
    <x:slots level="1" total="SlotsTotal 19" expended="SlotsRemaining 19"/>

    <x:level number="1" index="1" formfield="Spells 1015" prepared="Check Box 251"/>
    <x:level number="1" index="2" formfield="Spells 1023" prepared="Check Box 309"/>
    <x:level number="1" index="3" formfield="Spells 1024" prepared="Check Box 3010"/>
    <x:level number="1" index="4" formfield="Spells 1025" prepared="Check Box 3011"/>
    <x:level number="1" index="5" formfield="Spells 1026" prepared="Check Box 3012"/>
    <x:level number="1" index="6" formfield="Spells 1027" prepared="Check Box 3013"/>
    <x:level number="1" index="7" formfield="Spells 1028" prepared="Check Box 3014"/>
    <x:level number="1" index="8" formfield="Spells 1029" prepared="Check Box 3015"/>
    <x:level number="1" index="9" formfield="Spells 1030" prepared="Check Box 3016"/>
    <x:level number="1" index="10" formfield="Spells 1031" prepared="Check Box 3017"/>
    <x:level number="1" index="11" formfield="Spells 1032" prepared="Check Box 3018"/>
    <x:level number="1" index="12" formfield="Spells 1033" prepared="Check Box 3019"/>

    <x:slots level="2" total="SlotsTotal 20" expended="SlotsRemaining 20"/>
    <x:slots level="3" total="SlotsTotal 21" expended="SlotsRemaining 21"/>
    <x:slots level="4" total="SlotsTotal 22" expended="SlotsRemaining 22"/>
    <x:slots level="5" total="SlotsTotal 23" expended="SlotsRemaining 23"/>
    <x:slots level="6" total="SlotsTotal 24" expended="SlotsRemaining 24"/>
    <x:slots level="7" total="SlotsTotal 25" expended="SlotsRemaining 25"/>
    <x:slots level="8" total="SlotsTotal 26" expended="SlotsRemaining 26"/>
    <x:slots level="9" total="SlotsTotal 27" expended="SlotsRemaining 27"/>

  </x:spells>

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

  <xsl:template match="class-level |
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

  <xsl:template match="spellcasting">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="spellcasting/ability |
		       spellcasting/attack-bonus |
		       spellcasting/class |
		       spellcasting/save-dc">
    <xsl:variable name="x" select="name()"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:spells/*[local-name()=$x]/@formfield"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spells">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="spells/level">
    <xsl:variable name="level" select="@number"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:spells/x:slots[@level=$level]/@total"/>
      <xsl:with-param name="value" select="@slots"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:spells/x:slots[@level=$level]/@expended"/>
      <xsl:with-param name="value" select="@expended"/>
    </xsl:call-template>
    <xsl:for-each select="spell">
      <xsl:comment>
	<xsl:text> level </xsl:text>
	<xsl:value-of select="$level"/>
	<xsl:text> position </xsl:text>
	<xsl:value-of select="position()"/>
	<xsl:text> </xsl:text>
      </xsl:comment>
      <xsl:call-template name="field">
	<xsl:with-param name="name" select="document('')//x:spells/x:level[@number=$level][@index=position()]/@formfield"/>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
      <xsl:call-template name="field">
	<xsl:with-param name="name" select="document('')//x:spells/x:level[@number=$level][@index=position()]/@prepared"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value" select="@prepared"/>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>      
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="spells/level/spell">

  </xsl:template>

</xsl:stylesheet>
