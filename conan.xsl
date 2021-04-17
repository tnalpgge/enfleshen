<xsl:stylesheet
    version="1.0"
    xmlns:xfdf="http://ns.adobe.com/xfdf/"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:x="urn:tnalpgge:enfleshen"
    exclude-result-prefixes="xfdf">

  <xsl:import href="util.xsl"/>

  <xsl:template name="skill-field">
    <xsl:param name="name"/>
    <xsl:param name="expertise"/>
    <xsl:param name="focus"/>
    <xsl:param name="tn"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($name, '-Exp')"/>
      <xsl:with-param name="value" select="$expertise"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($name, '-Foc')"/>
      <xsl:with-param name="value" select="$focus"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($name, '-TN')"/>
      <xsl:with-param name="value" select="$tn"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="talent">
    <xsl:param name="fieldname"/>
    <xsl:param name="talent"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Name')"/>
      <xsl:with-param name="value" select="$talent/name/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Effect')"/>
      <xsl:with-param name="value" select="$talent/effect/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Skill')"/>
      <xsl:with-param name="value" select="$talent/skill/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Rank')"/>
      <xsl:with-param name="value" select="$talent/rank/text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="acronym-followed-by-word">
    <xsl:param name="thing"/>
    <xsl:value-of select="
concat(
  upper-case(
    substring-before($thing, '-')
  ),
  upper-case(
    substring(
      substring-after($thing, '-'),
      1,
      1
    )
  ),
  lower-case(
    substring(
      substring-after($thing, '-'),
      2
    )
  )
)
"/>
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
    <xsl:value-of select="
concat(
  upper-case(
    substring($thing, 1, 1)
  ),
  lower-case(
    substring(
      substring-before($thing, '-'),
      2
    )
  ),
  upper-case(
    substring-after($thing, '-')
  )
)
"/>
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

  <xsl:template name="checkbox-loop">
    <!--recursive loop until done-->
    <xsl:param name="i"/>
    <xsl:param name="max"/>
    <xsl:param name="watermark"/>
    <xsl:param name="name"/>
    <xsl:if test="$i &lt;= $max">
      <xsl:call-template name="field">
	<xsl:with-param name="name" select="concat($name, $i)"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value">
	      <xsl:choose>
		<xsl:when test="$i &lt;= $watermark">
		  <xsl:value-of select="number(1)"/>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:value-of select="number(0)"/>
		</xsl:otherwise>
	      </xsl:choose>
	    </xsl:with-param>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="checkbox-loop">
        <xsl:with-param name="i" select="number($i + 1)"/>
        <xsl:with-param name="max" select="number($max)"/>
	<xsl:with-param name="watermark" select="number($watermark)"/>
	<xsl:with-param name="name" select="$name"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="attack">
    <xsl:param name="fieldname"/>
    <xsl:param name="attack"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Name')"/>
      <xsl:with-param name="value" select="$attack/name/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'RangeReach')"/>
      <xsl:with-param name="value" select="$attack/range-reach/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Grip')"/>
      <xsl:with-param name="value" select="$attack/grip/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Size')"/>
      <xsl:with-param name="value" select="$attack/size/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Damage')"/>
      <xsl:with-param name="value" select="$attack/damage/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat($fieldname, 'Qualities')"/>
      <xsl:with-param name="value" select="$attack/qualities/text()"/>
    </xsl:call-template>
    <xsl:call-template name="checkbox-loop">
      <xsl:with-param name="name" select="concat($fieldname, 'Loads')"/>
      <xsl:with-param name="watermark" select="number($attack/loads/text())"/>
      <xsl:with-param name="i" select="number(1)"/>
      <xsl:with-param name="max" select="number(5)"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="creature">
    <xsl:param name="index"/>
    <xsl:param name="creature"/>
    <xsl:for-each select="$creature/name |
			  $creature/agility |
			  $creature/awareness |
			  $creature/brawn |
			  $creature/coordination |
			  $creature/intelligence |
			  $creature/personality |
			  $creature/willpower
			  ">
      <xsl:call-template name="field">
	<xsl:with-param name="name">
	  <xsl:call-template name="ucfirst2words">
	    <xsl:with-param name="thing">
	      <xsl:value-of select="concat('creature', $index, '-', local-name())"/>
	    </xsl:with-param>
	  </xsl:call-template>
	</xsl:with-param>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat('Creature', $index, 'SkillsDetails')"/>
      <xsl:with-param name="value">
	<xsl:text>Species: </xsl:text>
	<xsl:value-of select="species/text()"/>
	<xsl:text>&#xa;</xsl:text>
	<xsl:value-of select="skills-details/text()"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- Walk the document and produce  the output -->

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

  <xsl:template match="
    background |
    experience |
    attributes-and-skills |
    stress-and-harms |
    armor-soak |
    physical |
    mental
    ">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="
    age |
    appearance |
    archetype |
    background/caste |
    courage |
    education |
    gender |
    gold |
    head |
    homeland |
    nature |
    background/personality |
    renown |
    standing |
    torso |
    trait |
    upkeep
    ">
    <xsl:call-template name="single-word-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
    armor-qualities |
    character-name |
    left-arm |
    left-leg |
    right-arm |
    right-leg |
    war-story
    ">
    <xsl:call-template name="two-word-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
    agility |
    awareness |
    brawn |
    coordination |
    intelligence |
    attributes-and-skills/personality |
    willpower
    ">
    <xsl:call-template name="single-word-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value" select="@score"/>
    </xsl:call-template>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="experience/total-xp">
    <xsl:call-template name="word-with-acronym-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="experience/xp-spent">
    <xsl:call-template name="acronym-with-word-field">
      <xsl:with-param name="name" select="local-name()"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
    agility/acrobatics |
    agility/melee |
    brawn/athletics |
    awareness/insight |
    awareness/observation |
    coordination/parry |
    brawn/resistance |
    agility/stealth |
    awareness/survival |
    awareness/thievery |
    coordination/sailing |
    intelligence/alchemy |
    intelligence/craft |
    intelligence/healing |
    intelligence/linguistics |
    intelligence/lore |
    intelligence/warfare |
    personality/command |
    personality/counsel |
    personality/persuade |
    personality/society |
    willpower/discipline |
    willpower/sorcery
    ">
    <xsl:call-template name="skill-field">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst">
	  <xsl:with-param name="thing" select="local-name()"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="expertise" select="@expertise"/>
      <xsl:with-param name="focus" select="@focus"/>
      <xsl:with-param name="tn" select="@tn"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="
    coordination/ranged-weapons |
    personality/animal-handling
    ">
    <xsl:call-template name="skill-field">
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing" select="local-name()"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="expertise" select="@expertise"/>
      <xsl:with-param name="focus" select="@focus"/>
      <xsl:with-param name="tn" select="@tn"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="talents">
    <xsl:apply-templates select="
				 archetype |
				 bloodline |
				 education |
				 homeland |
				 nature
				 "/>
    <xsl:for-each select="caste">
      <xsl:call-template name="talent">
	<xsl:with-param name="fieldname">
	  <xsl:call-template name="ucfirst2words">
	    <xsl:with-param name="thing" select="concat(local-name(), '-talent', position())"/>
	  </xsl:call-template>
	</xsl:with-param>
	<xsl:with-param name="talent" select="."/>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="other">
      <xsl:call-template name="talent">
	<xsl:with-param name="fieldname">
	  <xsl:call-template name="ucfirst2words">
	    <xsl:with-param name="thing">
	      <xsl:choose>
		<xsl:when test="position() &lt; 3">
		  <xsl:value-of select="concat(local-name(), '-talent', position())"/>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:value-of select="concat('more-talent', position() - 2)"/>
		</xsl:otherwise>
	      </xsl:choose>
	    </xsl:with-param>
	  </xsl:call-template>
	</xsl:with-param>
	<xsl:with-param name="talent" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="
    talents/homeland |
    talents/bloodline |
    talents/education |
    talents/nature |
    talents/archetype
    ">
    <xsl:call-template name="talent">
      <xsl:with-param name="fieldname">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing" select="concat(local-name(), '-talent')"/>
	</xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="talent" select="."/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="attacks">
    <xsl:for-each select="attack">
      <xsl:call-template name="attack">
	<xsl:with-param name="fieldname">
	  <xsl:choose>
	    <xsl:when test="position() &lt; 3">
	      <xsl:text>PrimaryAttack</xsl:text>
	      <xsl:value-of select="position()"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>OtherAttack</xsl:text>
	      <xsl:value-of select="position() - 2"/>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:with-param>
	<xsl:with-param name="attack" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="vigor | resolve">
    <xsl:call-template name="checkbox-loop">
      <xsl:with-param name="i" select="number(1)"/>
      <xsl:with-param name="max" select="number(@score)"/>
      <xsl:with-param name="watermark" select="number(text())"/>
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst">
	  <xsl:with-param name="thing" select="local-name()"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="trauma | wounds">
    <xsl:call-template name="checkbox-loop">
      <xsl:with-param name="i" select="number(1)"/>
      <xsl:with-param name="max" select="number(5)"/>
      <xsl:with-param name="watermark" select="number(text())"/>
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst">
	  <xsl:with-param name="thing" select="local-name()"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="fortune-points">
    <xsl:call-template name="checkbox-loop">
      <xsl:with-param name="i" select="number(1)"/>
      <xsl:with-param name="max" select="number(5)"/>
      <xsl:with-param name="watermark" select="number(text())"/>
      <xsl:with-param name="name">
	<xsl:call-template name="ucfirst2words">
	  <xsl:with-param name="thing" select="local-name()"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="belongings">
    <xsl:for-each select="belonging">
      <xsl:call-template name="field">
	<xsl:with-param name="name">
	  <xsl:choose>
	    <xsl:when test="position() &lt; 6">
	      <xsl:call-template name="ucfirst">
		<xsl:with-param name="thing" select="concat(local-name(), position())"/>
	      </xsl:call-template>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:call-template name="ucfirst2words">
		<xsl:with-param name="thing" select="concat('additional-', local-name(), position() - 5)"/>
	      </xsl:call-template>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:with-param>
	<xsl:with-param name="value" select="text()"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="creatures">
    <xsl:for-each select="creature">
      <xsl:call-template name="creature">
	<xsl:with-param name="index" select="position()"/>
	<xsl:with-param name="creature" select="."/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
