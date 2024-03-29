<xsl:stylesheet
    version="1.0"
    xmlns:xfdf="http://ns.adobe.com/xfdf/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:x="urn:tnalpgge:enfleshen"
    exclude-result-prefixes="xfdf">

  <xsl:import href="dnd3e-util.xsl"/>
  <xsl:import href="util.xsl"/>
  <xsl:import href="walk.xsl"/>

  <x:abilities>
    <x:ability name="strength">
      <x:skill name="athletics"/>
      <x:melee-strike/>
      <x:melee-strike/>
      <x:melee-strike/>
    </x:ability>
    <x:ability name="dexterity">
      <x:skill name="acrobatics"/>
      <x:skill name="stealth"/>
      <x:skill name="thievery"/>
      <x:saving-throw name="reflex"/>
      <x:ranged-strike/>
      <x:ranged-strike/>
      <x:ranged-strike/>
    </x:ability>
    <x:ability name="constitution">
      <x:saving-throw name="fortitude"/>
    </x:ability>
    <x:ability name="intelligence">
      <x:skill name="arcana"/>
      <x:skill name="crafting"/>
      <x:skill name="lore1"/>
      <x:skill name="lore2"/>
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

  <x:proficiency-levels>
    <x:proficiency-level name="trained" value="1"/>
    <x:proficiency-level name="expert" value="2"/>
    <x:proficiency-level name="master" value="3"/>
    <x:proficiency-level name="legendary" value="4"/>
  </x:proficiency-levels>

  <xsl:variable name="strength" select="number(/character/abilities/strength/text())"/>
  <xsl:variable name="dexterity" select="number(/character/abilities/dexterity/text())"/>
  <xsl:variable name="constitution" select="number(/character/abilities/constitution/text())"/>
  <xsl:variable name="intelligence" select="number(/character/abilities/intelligence/text())"/>
  <xsl:variable name="wisdom" select="number(/character/abilities/wisdom/text())"/>
  <xsl:variable name="charisma" select="number(/character/abilities/charisma/text())"/>
 
  <xsl:variable name="strength-modifier">
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$strength"/>
    </xsl:call-template>
  </xsl:variable> 

  <xsl:variable name="class" select="lower-case(/character/class/text())"/>
  <xsl:variable name="characterlevel" select="number(/character/level/text())"/>

  <xsl:variable name="key-ability-name"/>  <!-- provide as string parameter -->

  <xsl:variable name="key">
    <xsl:choose>
      <xsl:when test="starts-with(lower-case($key-ability-name), 'str')">
	<xsl:value-of select="$strength"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($key-ability-name), 'dex')">
	<xsl:value-of select="$dexterity"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($key-ability-name), 'cha')">
	<xsl:value-of select="$charisma"/>
      </xsl:when>
      <xsl:when test="$key-ability-name">
	<xsl:message>You may not select that ability as your key ability</xsl:message>
      </xsl:when>
      <xsl:when test="starts-with($class, 'barbarian')">
	<xsl:value-of select="$strength"/>
      </xsl:when>
      <xsl:when test="starts-with($class, 'alchemist') or starts-with($class, 'wizard')">
	<xsl:value-of select="$intelligence"/>
      </xsl:when>
      <xsl:when test="starts-with($class, 'cleric') or starts-with($class, 'druid')">
	<xsl:value-of select="$wisdom"/>
      </xsl:when>
      <xsl:when test="starts-with($class, 'bard') or starts-with($class, 'sorcerer')">
	<xsl:value-of select="$charisma"/>
      </xsl:when>
      <xsl:when test="starts-with($class, 'chamption') or starts-with($class, 'fighter') or starts-with($class, 'monk') or starts-with($class, 'ranger')">
	<xsl:choose>
	  <xsl:when test="$strength &gt; $dexterity">
	    <xsl:value-of select="$strength"/>
	  </xsl:when>
	  <xsl:when test="$dexterity &gt; $strength">
	    <xsl:value-of select="$dexterity"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:message>Strength vs. Dexterity problem!  Please set variable key-ability-name explicitly</xsl:message>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:when test="starts-with($class, 'rogue')">
	<xsl:choose>
	  <xsl:when test="($strength &gt; $dexterity) and ($strength &gt; $charisma)">
	    <xsl:value-of select="$strength"/>
	  </xsl:when>
	  <xsl:when test="($dexterity &gt; $strength) and ($dexterity &gt; $charisma)">
	    <xsl:value-of select="$dexterity"/>
	  </xsl:when>
	  <xsl:when test="($charisma &gt; $strength) and ($charisma &gt; $dexterity)">
	    <xsl:value-of select="$charisma"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:message>Rogue problem!  Please set variable key-ability-name explicitly</xsl:message>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:otherwise>
	<xsl:message>Could not determine key ability score</xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="key-modifier">
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$key"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="spell-atk-prof">
    <xsl:call-template name="proficiency-bonus">
      <xsl:with-param name="level" select="/character/spellcasting/attack-roll/proficiency/@level"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="spell-dc-prof">
    <xsl:call-template name="proficiency-bonus">
      <xsl:with-param name="level" select="/character/spellcasting/spell-dc/proficiency/@level"/>
    </xsl:call-template>
  </xsl:variable>

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
		       conditions |
		       deity |
		       dislikes |
		       dying |
		       enemies |
		       ethnicity |
		       height |
		       immunities |
		       likes |
		       nationality |
		       organizations |
		       resistances |
		       senses |
		       size |
		       speed |
		       weight |
		       wounded
    ">
    <xsl:call-template name="single-word-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
		       character-name |
		       character-sketch |
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

  <xsl:template name="skill-modifier">
    <xsl:param name="skill"/>
    <xsl:param name="score"/>
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat($skill, '-modifier')"/>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="saving-throw-modifier">
    <xsl:param name="save"/>
    <xsl:param name="score"/>
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name" select="concat($save, '-save-modifier')"/>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
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
    <xsl:for-each select="document('')//x:abilities/x:ability[@name=$name]/x:saving-throw">
      <xsl:call-template name="saving-throw-modifier">
	<xsl:with-param name="save" select="@name"/>
	<xsl:with-param name="score" select="$score"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="strike-ability-modifier">
    <xsl:param name="strike"/>
    <xsl:param name="seq"/>
    <xsl:param name="score"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst4words">
	  <xsl:with-param name="thing" select="concat($strike, '-strike', $seq, '-attack-modifier')"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
		       abilities |
		       armor-class |
		       campaign-notes |
		       class-dc |
		       encumbrance |
		       feats |
		       feats/ancestry |
		       feats/general |
		       feats/skill |
		       hit-points |
		       inventory |
		       money |
		       perception |
		       personality |
		       saving-throws |
		       shield |
		       spellcasting |
		       spellcasting/attack-roll |
		       spellcasting/spell-dc
		       ">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="abilities/strength">
    <xsl:variable name="name" select="local-name()"/>
    <xsl:variable name="score" select="number(text())"/>
    <xsl:variable name="modifier">
      <xsl:call-template name="ability-modifier">
	<xsl:with-param name="score" select="$score"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="signed-modifier">
      <xsl:call-template name="signed-ability-modifier">
	<xsl:with-param name="score" select="$score"/>
      </xsl:call-template>      
    </xsl:variable>
    <xsl:call-template name="ability">
      <xsl:with-param name="name" select="$name"/>
      <xsl:with-param name="score" select="$score"/>
    </xsl:call-template>
    <xsl:for-each select="document('')//x:abilities/x:ability[@name=$name]/x:melee-strike">
      <xsl:call-template name="strike-ability-modifier">
	<xsl:with-param name="strike">
	  <xsl:text>melee</xsl:text>
	</xsl:with-param>
	<xsl:with-param name="seq" select="position()"/>
	<xsl:with-param name="score" select="$score"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name">
	<xsl:text>encumbrance-modifier</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value" select="$signed-modifier"/>
    </xsl:call-template>
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name">
	<xsl:text>encumbrance-encumbered</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value" select="5 + $modifier"/>
    </xsl:call-template>
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name">
	<xsl:text>encumbrance-maximum</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value" select="10 + $modifier"/>
    </xsl:call-template>    
  </xsl:template>

  <xsl:template match="abilities/dexterity">
    <xsl:variable name="name" select="local-name()"/>
    <xsl:variable name="score" select="number(text())"/>
    <xsl:call-template name="ability">
      <xsl:with-param name="name" select="$name"/>
      <xsl:with-param name="score" select="$score"/>
    </xsl:call-template>
    <xsl:for-each select="document('')//x:abilities/x:ability[@name=$name]/x:ranged-strike">
      <xsl:call-template name="strike-ability-modifier">
	<xsl:with-param name="strike">
	  <xsl:text>ranged</xsl:text>
	</xsl:with-param>
	<xsl:with-param name="seq" select="position()"/>
	<xsl:with-param name="score" select="$score"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name">
	<xsl:text>armor-class-modifier</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="abilities/wisdom">
    <xsl:variable name="name" select="local-name()"/>
    <xsl:variable name="score" select="number(text())"/>
    <xsl:call-template name="ability">
      <xsl:with-param name="name" select="$name"/>
      <xsl:with-param name="score" select="$score"/>
    </xsl:call-template>
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name">
	<xsl:text>perception-modifier</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
		       abilities/charisma |
		       abilities/constitution |
		       abilities/intelligence
    ">
    <xsl:call-template name="ability">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="score" select="number(text())"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="class-dc/key">
    <xsl:call-template name="word-acronym-word-field">
      <xsl:with-param name="name" select="concat('class-dc-', local-name())"/>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$key"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="class-dc/item | class-dc/total">
    <xsl:call-template name="word-acronym-word-field">
      <xsl:with-param name="name" select="concat('class-dc-', local-name())"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spellcasting/attack-roll/total">
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name" select="concat('spell-attack-', local-name())"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="text()">
	    <xsl:value-of select="text()"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="$spell-atk-prof + $key-modifier"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spellcasting/attack-roll/key">
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name">
	<xsl:text>spell-attack-key</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$key"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spellcasting/attack-roll/proficiency">
    <xsl:call-template name="proficiency-fields">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing">
	    <xsl:text>spell-attack</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="level" select="@level"/>
      <xsl:with-param name="override" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spell-dc/total">
    <xsl:call-template name="word-acronym-word-field">
      <xsl:with-param name="name" select="concat('spell-dc-', local-name())"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="text()">
	    <xsl:value-of select="text()"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="$spell-dc-prof + $key-modifier"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spell-dc/key">
    <xsl:call-template name="word-acronym-word-field">
      <xsl:with-param name="name" select="concat('spell-dc-', local-name())"/>
      <xsl:with-param name="value">
	<xsl:call-template name="ability-modifier">
	  <xsl:with-param name="score" select="$key"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spell-dc/proficiency">
    <xsl:call-template name="proficiency-fields">
      <xsl:with-param name="name">
	<xsl:call-template name="word-followed-by-acronym">
	  <xsl:with-param name="thing">
	    <xsl:text>spell-dc</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="level" select="@level"/>
      <xsl:with-param name="override" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="proficiency-bonus">
    <xsl:param name="level"/>
    <xsl:choose>
      <xsl:when test="starts-with(lower-case($level), 't')">
	<xsl:value-of select="2 + $characterlevel"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($level), 'e')">
	<xsl:value-of select="4 + $characterlevel"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($level), 'm')">
	<xsl:value-of select="6 + $characterlevel"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($level), 'l')">
	<xsl:value-of select="8 + $characterlevel"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="proficiency-box">
    <xsl:param name="name"/>
    <xsl:param name="level"/>
    <xsl:param name="value"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($name, 'ProficiencyBox', upper-case(substring($level, 1, 1)))"/>
      <xsl:with-param name="value">
	<xsl:call-template name="checkbox">
	  <xsl:with-param name="value" select="$value"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="proficiency-boxes">
    <xsl:param name="name"/>
    <xsl:param name="level"/>
    <xsl:variable name="watermark" select="document('')//x:proficiency-levels/x:proficiency-level[lower-case(substring($level, 1, 1)) = lower-case(substring(@name, 1, 1))]/@value"/>
    <xsl:for-each select="document('')//x:proficiency-levels/x:proficiency-level">
      <xsl:call-template name="proficiency-box">
	<xsl:with-param name="name" select="$name"/>
	<xsl:with-param name="level" select="@name"/>
	<xsl:with-param name="value">
	  <xsl:choose>
	    <xsl:when test="@value &lt;= $watermark">
	      <xsl:text>true</xsl:text>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>false</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="proficiency-fields">
    <xsl:param name="name"/>
    <xsl:param name="level"/>
    <xsl:param name="override"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($name, 'ProficiencyBonus')"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="boolean($override)">
	    <xsl:value-of select="$override"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:call-template name="proficiency-bonus">
	      <xsl:with-param name="level" select="$level"/>
	    </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="proficiency-boxes">
      <xsl:with-param name="name" select="$name"/>
      <xsl:with-param name="level" select="$level"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="class-dc/proficiency">
    <xsl:call-template name="proficiency-fields">
      <xsl:with-param name="name">
	<xsl:text>ClassDC</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="level" select="@level"/>
      <xsl:with-param name="override" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="armor-class/total | armor-class/cap | armor-class/item">
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name" select="concat('armor-class-', local-name())"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="armor-class/proficiency">
    <xsl:call-template name="proficiency-fields">
      <xsl:with-param name="name">
	<xsl:text>ArmorClass</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="level" select="@level"/>
      <xsl:with-param name="override" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
		       armor-class/heavy |
		       armor-class/light |
		       armor-class/medium |
		       armor-class/unarmored
		       ">
    <xsl:call-template name="proficiency-boxes">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst3words">
	  <xsl:with-param name="thing" select="concat('armor-type-', local-name())"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="level" select="@level"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="shield/bonus | shield/hardness">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat('shield-', local-name())"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="shield/max-hp | shield/current-hp">
    <xsl:call-template name="two-word-acronym-field">
      <xsl:with-param name="name" select="concat('shield-', local-name())"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="break-threshold">
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name" select="concat('shield-', local-name())"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="saving-throw">
    <xsl:param name="name"/>
    <xsl:for-each select="total | item">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat($name, '-save-', local-name())"/>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:call-template name="proficiency-fields">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing" select="concat($name, '-save')"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="level" select="proficiency/@level"/>
      <xsl:with-param name="override" select="proficiency/text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="fortitude | reflex | will">
    <xsl:call-template name="saving-throw">
      <xsl:with-param name="name" select="local-name()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
		       hit-points/current |
		       hit-points/maximum |
		       hit-points/temporary
		       ">
    <xsl:call-template name="word-with-acronym-field">
      <xsl:with-param name="name" select="concat(local-name(), '-hp')"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="perception/total">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat('perception-', local-name())"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="perception/proficiency">
    <xsl:call-template name="proficiency-fields">
      <xsl:with-param name="name">
	<xsl:text>Perception</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="level" select="@level"/>
      <xsl:with-param name="override" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="damage-type-boxes">
    <xsl:param name="name"/>
    <xsl:param name="element"/>
    <xsl:for-each select="
			  $element/@bludgeoning |
			  $element/@piercing |
			  $element/@slashing
			  ">
      <xsl:call-template name="five-word-field">
	<xsl:with-param name="name" select="concat($name, '-damage-type-', local-name())"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value" select="."/>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="strike-damage">
    <xsl:param name="ndx"/>
    <xsl:param name="element"/>
    <xsl:param name="strike"/>
    <xsl:call-template name="four-word-field">
      <xsl:with-param name="name" select="concat($strike, '-strike', $ndx, '-damage-dice')"/>
      <xsl:with-param name="value" select="$element/dice/text()"/>
    </xsl:call-template>
    <xsl:call-template name="damage-type-boxes">
      <xsl:with-param name="name" select="concat($strike, '-strike', $ndx)"/>
      <xsl:with-param name="element" select="$element/type"/>
    </xsl:call-template>
    <xsl:if test="$element/special">
      <xsl:call-template name="four-word-field">
	<xsl:with-param name="name" select="concat($strike, '-strike', $ndx, '-damage-special')"/>
	<xsl:with-param name="value" select="$element/special/text()"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="strike">
    <xsl:param name="ndx"/>
    <xsl:param name="element"/>
    <xsl:param name="strike"/>
    <xsl:for-each select="
			  $element/item |
			  $element/other |
			  $element/specialization |
			  $element/total |
			  $element/traits |
			  $element/weapon
			  ">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat($strike, '-strike', $ndx, '-', local-name())"/>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:call-template name="proficiency-fields">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing" select="concat($strike, '-strike', $ndx)"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="level" select="proficiency/@level"/>
      <xsl:with-param name="override" select="proficiency/text()"/>
    </xsl:call-template>
    <xsl:call-template name="strike-damage">
      <xsl:with-param name="ndx" select="$ndx"/>
      <xsl:with-param name="element" select="damage"/>
      <xsl:with-param name="strike" select="$strike"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="melee-strikes">
    <xsl:for-each select="melee-strike">
      <xsl:call-template name="strike">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
	<xsl:with-param name="strike" select="substring-before(local-name(), '-')"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="ranged-strikes">
    <xsl:for-each select="ranged-strike">
      <xsl:call-template name="strike">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
	<xsl:with-param name="strike" select="substring-before(local-name(), '-')"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="other-weapon-proficiency">
    <xsl:param name="ndx"/>
    <xsl:param name="element"/>
    <xsl:call-template name="proficiency-boxes">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing" select="concat(local-name($element), $ndx, '-weapon')"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="level" select="$element/@level"/>
    </xsl:call-template>
    <xsl:call-template name="four-word-field">
      <xsl:with-param name="name" select="concat(local-name($element), $ndx, '-weapon-proficiency-name')"/>
      <xsl:with-param name="value" select="$element/text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="weapon-proficiencies">
    <xsl:apply-templates select="martial | simple"/>
    <xsl:for-each select="other">
      <xsl:call-template name="other-weapon-proficiency">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="
		       weapon-proficiencies/martial |
		       weapon-proficiencies/simple
		       ">
    <xsl:call-template name="proficiency-boxes">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing" select="concat(local-name(), '-weapon')"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="level" select="@level"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="skill">
    <xsl:param name="element"/>
    <xsl:param name="ndx"/>
    <xsl:variable name="skill">
      <xsl:call-template name="ucfirst">
	<xsl:with-param name="thing" select="local-name($element)"/>
      </xsl:call-template>
      <xsl:if test="local-name($element) = 'lore'">
	<xsl:value-of select="$ndx"/>
      </xsl:if>
    </xsl:variable>
    <xsl:for-each select="
			  $element/armor |
			  $element/item |
			  $element/total
			  ">
      <xsl:call-template name="two-word-field">
	<xsl:with-param name="name" select="concat($skill, '-', local-name())"/>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:call-template name="proficiency-fields">
      <xsl:with-param name="name" select="$skill"/>
      <xsl:with-param name="level" select="$element/proficiency/@level"/>
      <xsl:with-param name="override" select="$element/proficiency/text()"/>
    </xsl:call-template>
    <xsl:if test="starts-with($skill, 'lore')">
      <xsl:call-template name="two-word-field">
	<xsl:with-param name="name" select="concat($skill, '-subject')"/>
	<xsl:with-param name="value" select="$element/@subject"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="skills">
    <xsl:apply-templates select="*[local-name() != 'lore']"/>
    <xsl:for-each select="lore">
      <xsl:call-template name="skill">
	<xsl:with-param name="element" select="."/>
	<xsl:with-param name="ndx" select="position()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="skills/*[local-name() != 'lore']">
    <xsl:variable name="skill" select="local-name()"/>
    <xsl:call-template name="skill">
      <xsl:with-param name="element" select="."/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="languages">
    <xsl:call-template name="single-word-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value">
	<xsl:for-each select="language">
	  <xsl:value-of select="text()"/>
	  <xsl:if test="position() &lt; last()">
	    <xsl:text>, </xsl:text>
	  </xsl:if>
	</xsl:for-each>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
		       feats/ancestry/heritage |
		       feats/ancestry/special |
		       feats/skill/background
		       ">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat(local-name(), '-feat')"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
		       ancestry-feat |
		       class-feat |
		       general-feat |
		       skill-feat
		       ">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat(local-name(), @level)"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="class-feats">
    <xsl:for-each select="feature[@level = 1]">
      <xsl:call-template name="two-word-acronym-field">
	<xsl:with-param name="name" select="concat('class-', local-name(), '-', @level, substring('abcdefghijklmnopqrstuvwxyz', position(), 1))"/>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:apply-templates select="feature[@level > 1]"/>
  </xsl:template>

  <xsl:template match="class-feats/feature[@level > 1]">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat('class-', local-name(), @level)"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="feats/bonus">
    <xsl:for-each select="bonus-feat">
      <xsl:call-template name="two-word-field">
	<xsl:with-param name="name" select="concat(local-name(), position())"/>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="inventory-item">
    <xsl:param name="ndx"/>
    <xsl:param name="element"/>
    <xsl:variable name="inventory" select="local-name($element)"/>
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name" select="concat($inventory, $ndx, '-name')"/>
      <xsl:with-param name="value" select="$element/text()"/>
    </xsl:call-template>
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name" select="concat($inventory, $ndx, '-bulk')"/>
      <xsl:with-param name="value" select="$element/@bulk"/>
    </xsl:call-template>
    <xsl:if test="$element/@invest">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat($inventory, $ndx, '-invest')"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value" select="$element/@invest"/>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="other-items | readied-items | worn-items">
    <xsl:for-each select="*[ends-with(local-name(), '-item')]">
      <xsl:call-template name="inventory-item">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="cp | sp | gp | pp">
    <xsl:call-template name="word-with-acronym-field">
      <xsl:with-param name="name" select="concat('money-', local-name())"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="bulk">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat('total-', local-name())"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="encumbrance/encumbered | encumbrance/maximum">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat('encumbrance-', local-name())"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="starts-with(local-name(), 'e')">
	    <xsl:value-of select="5 + number($strength-modifier)"/>
	  </xsl:when>
	  <xsl:when test="starts-with(local-name(), 'm')">
	    <xsl:value-of select="10 + number($strength-modifier)"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:message>Encumbrance problem!</xsl:message>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spellcasting/methods | spellcasting/traditions">
    <xsl:variable name="thing" select="substring(local-name(), 1, string-length(local-name()) - 1)"/>
    <xsl:for-each select="@*">
      <xsl:call-template name="two-word-field">
	<xsl:with-param name="name" select="concat(local-name(), '-', $thing)"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value" select="."/>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="cantrip-or-spell">
    <xsl:param name="ndx"/>
    <xsl:param name="element"/>
    <xsl:variable name="thing" select="local-name($element)"/>
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="concat($thing, $ndx, '-', 'actions')"/>
      <xsl:with-param name="value" select="$element/@actions"/>
    </xsl:call-template>
    <xsl:for-each select="$element/description | $element/name">
      <xsl:call-template name="two-word-field">
	<xsl:with-param name="name" select="concat($thing, $ndx, '-', local-name())"/>
	<xsl:with-param name="value">
	  <xsl:value-of select="text()"/>
	  <xsl:if test="(local-name() = 'name') and ($element/@level)">
	    <xsl:text> (Level </xsl:text>
	    <xsl:value-of select="$element/@level"/>
	    <xsl:text>)</xsl:text>
	  </xsl:if>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="
			  $element/@material |
			  $element/@prepared |
			  $element/@somatic |
			  $element/@verbal
			  ">
      <xsl:call-template name="two-word-field">
	<xsl:with-param name="name" select="concat($thing, $ndx, '-', local-name())"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value" select="."/>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="cantrips | spells">
    <xsl:for-each select="cantrip | spell">
      <xsl:call-template name="cantrip-or-spell">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="innate-spell">
    <xsl:param name="ndx"/>
    <xsl:param name="element"/>
    <xsl:for-each select="$element/description | $element/name">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat('innate-spell', $ndx, '-', local-name())"/>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="$element/@actions | $element/@frequency">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat('innate-spell', $ndx, '-', local-name())"/>
	<xsl:with-param name="value" select="."/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="
			  $element/@material |
			  $element/@somatic |
			  $element/@verbal
			  ">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat('innate-spell', $ndx, '-', local-name())"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value" select="."/>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="innate-spells">
    <xsl:for-each select="innate-spell">
      <xsl:call-template name="innate-spell">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="focus-spell">
    <xsl:param name="ndx"/>
    <xsl:param name="element"/>
    <xsl:variable name="thing" select="local-name($element)"/>
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name" select="concat($thing, $ndx, '-name')"/>
      <xsl:with-param name="value" select="$element/text()"/>
    </xsl:call-template>
    <xsl:call-template name="three-word-field">
      <xsl:with-param name="name" select="concat($thing, $ndx, '-actions')"/>
      <xsl:with-param name="value" select="$element/@actions"/>
    </xsl:call-template>
    <xsl:for-each select="@material | @somatic | @verbal">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat($thing, $ndx, '-', local-name())"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value" select="."/>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="focus-spells">
    <xsl:apply-templates select="focus-points"/>
    <xsl:for-each select="focus-spell">
      <xsl:call-template name="focus-spell">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="focus-points">
    <xsl:variable name="thing" select="local-name()"/>
    <xsl:for-each select="@current | @maximum">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat($thing, '-', local-name())"/>
	<xsl:with-param name="value" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="slots">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name">
	<xsl:text>cantrip-level</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value" select="@cantrip-level"/>
    </xsl:call-template>
    <xsl:apply-templates select="level"/>
  </xsl:template>

  <xsl:template match="slots/level">
    <xsl:variable name="lvl" select="@number"/>
    <xsl:for-each select="@remaining | @total">
      <xsl:call-template name="four-word-field">
	<xsl:with-param name="name" select="concat('spell-slots-level', $lvl, '-', local-name())"/>
	<xsl:with-param name="value" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="action-or-reaction">
    <xsl:param name="ndx"/>
    <xsl:param name="element"/>
    <xsl:param name="action"/>
    <xsl:for-each select="
			  $element/description |
			  $element/name |
			  $element/traits |
			  $element/trigger
			  ">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat($action, $ndx, '-', local-name())"/>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="$element/@actions | $element/@page">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat($action, $ndx, '-', local-name())"/>
	<xsl:with-param name="value" select="."/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="$element/@free | $element/@reaction">
      <xsl:call-template name="three-word-field">
	<xsl:with-param name="name" select="concat($action, $ndx, '-', local-name())"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value" select="."/>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="actions-activities">
    <xsl:for-each select="action">
      <xsl:call-template name="action-or-reaction">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
	<xsl:with-param name="action">
	  <xsl:text>action-activity</xsl:text>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="free-actions-reactions">
    <xsl:for-each select="action">
      <xsl:call-template name="action-or-reaction">
	<xsl:with-param name="ndx" select="position()"/>
	<xsl:with-param name="element" select="."/>
	<xsl:with-param name="action">
	  <xsl:text>free-reaction</xsl:text>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
