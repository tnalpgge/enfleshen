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

  <x:saving-throws>
    <x:saving-throw ability="strength" proficient="Check Box 11"/>
    <x:saving-throw ability="dexterity" proficient="Check Box 18"/>
    <x:saving-throw ability="constitution" proficient="Check Box 19"/>
    <x:saving-throw ability="intelligence" proficient="Check Box 20"/>
    <x:saving-throw ability="wisdom" proficient="Check Box 21"/>
    <x:saving-throw ability="charisma" proficient="Check Box 22"/>
  </x:saving-throws>

  <x:skills>
    <x:skill name="acrobatics" formfield="Acrobatics" proficient="Check Box 23" ability="dexterity"/>
    <x:skill name="animal-handling" formfield="Animal" proficient="Check Box 24" ability="wisdom"/>
    <x:skill name="arcana" formfield="Arcana" proficient="Check Box 25" ability="intelligence"/>
    <x:skill name="athletics" formfield="Athletics" proficient="Check Box 26" ability="strength"/>
    <x:skill name="deception" formfield="Deception " proficient="Check Box 27" ability="charisma"/>
    <x:skill name="history" formfield="History " proficient="Check Box 28" ability="intelligence"/>
    <x:skill name="insight" formfield="Insight" proficient="Check Box 29" ability="wisdom"/>
    <x:skill name="intimidation" formfield="Intimidation" proficient="Check Box 30" ability="charisma"/>
    <x:skill name="investigation" formfield="Investigation " proficient="Check Box 31" ability="intelligence"/>
    <x:skill name="medicine" formfield="Medicine" proficient="Check Box 32" ability="wisdom"/>
    <x:skill name="nature" formfield="Nature" proficient="Check Box 33" ability="intelligence"/>
    <x:skill name="perception" formfield="Perception " proficient="Check Box 34" ability="wisdom"/>
    <x:skill name="performance" formfield="Performance" proficient="Check Box 35" ability="charisma"/>
    <x:skill name="persuasion" formfield="Persuasion" proficient="Check Box 36" ability="charisma"/>
    <x:skill name="religion" formfield="Religion" proficient="Check Box 37" ability="intelligence"/>
    <x:skill name="sleight-of-hand" formfield="SleightofHand" proficient="Check Box 38" ability="dexterity"/>
    <x:skill name="stealth" formfield="Stealth " proficient="Check Box 39" ability="dexterity"/>
    <x:skill name="survival" formfield="Survival" proficient="Check Box 40" ability="wisdom"/>
  </x:skills>

  <x:death-saves>
    <x:success>Check Box 12</x:success>
    <x:success>Check Box 13</x:success>
    <x:success>Check Box 14</x:success>
    <x:failure>Check Box 15</x:failure>
    <x:failure>Check Box 16</x:failure>
    <x:failure>Check Box 17</x:failure>
  </x:death-saves>

  <x:attacks>
    <x:attack weapon="Wpn Name" bonus="Wpn1 AtkBonus" damage="Wpn1 Damage"/>
    <x:attack weapon="Wpn Name 2" bonus="Wpn2 AtkBonus " damage="Wpn2 Damage "/>
    <x:attack weapon="Wpn Name 3" bonus="Wpn3 AtkBonus  " damage="Wpn3 Damage "/>
  </x:attacks>

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

    <x:level number="2" index="1" formfield="Spells 1046" prepared="Check Box 313"/>
    <x:level number="2" index="2" formfield="Spells 1034" prepared="Check Box 310"/>
    <x:level number="2" index="3" formfield="Spells 1035" prepared="Check Box 3020"/>
    <x:level number="2" index="4" formfield="Spells 1036" prepared="Check Box 3021"/>
    <x:level number="2" index="5" formfield="Spells 1037" prepared="Check Box 3022"/>
    <x:level number="2" index="6" formfield="Spells 1038" prepared="Check Box 3023"/>
    <x:level number="2" index="7" formfield="Spells 1039" prepared="Check Box 3024"/>
    <x:level number="2" index="8" formfield="Spells 1040" prepared="Check Box 3025"/>
    <x:level number="2" index="9" formfield="Spells 1041" prepared="Check Box 3026"/>
    <x:level number="2" index="10" formfield="Spells 1042" prepared="Check Box 3027"/>
    <x:level number="2" index="11" formfield="Spells 1043" prepared="Check Box 3028"/>
    <x:level number="2" index="12" formfield="Spells 1044" prepared="Check Box 3029"/>
    <x:level number="2" index="13" formfield="Spells 1045" prepared="Check Box 3030"/>

    <x:slots level="3" total="SlotsTotal 21" expended="SlotsRemaining 21"/>

    <x:level number="3" index="1" formfield="Spells 1048" prepared="Check Box 315"/>
    <x:level number="3" index="2" formfield="Spells 1047" prepared="Check Box 314"/>
    <x:level number="3" index="3" formfield="Spells 1049" prepared="Check Box 3031"/>
    <x:level number="3" index="4" formfield="Spells 1050" prepared="Check Box 3032"/>
    <x:level number="3" index="5" formfield="Spells 1051" prepared="Check Box 3033"/>
    <x:level number="3" index="6" formfield="Spells 1052" prepared="Check Box 3034"/>
    <x:level number="3" index="7" formfield="Spells 1053" prepared="Check Box 3035"/>
    <x:level number="3" index="8" formfield="Spells 1054" prepared="Check Box 3036"/>
    <x:level number="3" index="9" formfield="Spells 1055" prepared="Check Box 3037"/>
    <x:level number="3" index="10" formfield="Spells 1056" prepared="Check Box 3038"/>
    <x:level number="3" index="11" formfield="Spells 1057" prepared="Check Box 3039"/>
    <x:level number="3" index="12" formfield="Spells 1058" prepared="Check Box 3040"/>
    <x:level number="3" index="13" formfield="Spells 1059" prepared="Check Box 3041"/>

    <x:slots level="4" total="SlotsTotal 22" expended="SlotsRemaining 22"/>

    <x:level number="4" index="1" formfield="Spells 1061" prepared="Check Box 317"/>
    <x:level number="4" index="2" formfield="Spells 1060" prepared="Check Box 316"/>
    <x:level number="4" index="3" formfield="Spells 1062" prepared="Check Box 3042"/>
    <x:level number="4" index="4" formfield="Spells 1063" prepared="Check Box 3043"/>
    <x:level number="4" index="5" formfield="Spells 1064" prepared="Check Box 3044"/>
    <x:level number="4" index="6" formfield="Spells 1065" prepared="Check Box 3045"/>
    <x:level number="4" index="7" formfield="Spells 1066" prepared="Check Box 3046"/>
    <x:level number="4" index="8" formfield="Spells 1067" prepared="Check Box 3047"/>
    <x:level number="4" index="9" formfield="Spells 1068" prepared="Check Box 3048"/>
    <x:level number="4" index="10" formfield="Spells 1069" prepared="Check Box 3049"/>
    <x:level number="4" index="11" formfield="Spells 1070" prepared="Check Box 3050"/>
    <x:level number="4" index="12" formfield="Spells 1071" prepared="Check Box 3051"/>
    <x:level number="4" index="13" formfield="Spells 1072" prepared="Check Box 3052"/>

    <x:slots level="5" total="SlotsTotal 23" expended="SlotsRemaining 23"/>

    <x:level number="5" index="1" formfield="Spells 1074" prepared="Check Box 319"/>
    <x:level number="5" index="2" formfield="Spells 1073" prepared="Check Box 318"/>
    <x:level number="5" index="3" formfield="Spells 1075" prepared="Check Box 3053"/>
    <x:level number="5" index="4" formfield="Spells 1076" prepared="Check Box 3054"/>
    <x:level number="5" index="5" formfield="Spells 1077" prepared="Check Box 3055"/>
    <x:level number="5" index="6" formfield="Spells 1078" prepared="Check Box 3056"/>
    <x:level number="5" index="7" formfield="Spells 1079" prepared="Check Box 3057"/>
    <x:level number="5" index="8" formfield="Spells 1080" prepared="Check Box 3058"/>
    <x:level number="5" index="9" formfield="Spells 1081" prepared="Check Box 3059"/>

    <x:slots level="6" total="SlotsTotal 24" expended="SlotsRemaining 24"/>

    <x:level number="6" index="1" formfield="Spells 1083" prepared="Check Box 321"/>
    <x:level number="6" index="2" formfield="Spells 1082" prepared="Check Box 320"/>
    <x:level number="6" index="3" formfield="Spells 1084" prepared="Check Box 3060"/>
    <x:level number="6" index="4" formfield="Spells 1085" prepared="Check Box 3061"/>
    <x:level number="6" index="5" formfield="Spells 1086" prepared="Check Box 3062"/>
    <x:level number="6" index="6" formfield="Spells 1087" prepared="Check Box 3063"/>
    <x:level number="6" index="7" formfield="Spells 1088" prepared="Check Box 3064"/>
    <x:level number="6" index="8" formfield="Spells 1089" prepared="Check Box 3065"/>
    <x:level number="6" index="9" formfield="Spells 1090" prepared="Check Box 3066"/>

    <x:slots level="7" total="SlotsTotal 25" expended="SlotsRemaining 25"/>

    <x:level number="7" index="1" formfield="Spells 1092" prepared="Check Box 323"/>
    <x:level number="7" index="2" formfield="Spells 1091" prepared="Check Box 322"/>
    <x:level number="7" index="3" formfield="Spells 1093" prepared="Check Box 3067"/>
    <x:level number="7" index="4" formfield="Spells 1094" prepared="Check Box 3068"/>
    <x:level number="7" index="5" formfield="Spells 1095" prepared="Check Box 3069"/>
    <x:level number="7" index="6" formfield="Spells 1096" prepared="Check Box 3070"/>
    <x:level number="7" index="7" formfield="Spells 1097" prepared="Check Box 3071"/>
    <x:level number="7" index="8" formfield="Spells 1098" prepared="Check Box 3072"/>
    <x:level number="7" index="9" formfield="Spells 1099" prepared="Check Box 3073"/>

    <x:slots level="8" total="SlotsTotal 26" expended="SlotsRemaining 26"/>

    <x:level number="8" index="1" formfield="Spells 10101" prepared="Check Box 325"/>
    <x:level number="8" index="2" formfield="Spells 10100" prepared="Check Box 324"/>
    <x:level number="8" index="3" formfield="Spells 10102" prepared="Check Box 3074"/>
    <x:level number="8" index="4" formfield="Spells 10103" prepared="Check Box 3075"/>
    <x:level number="8" index="5" formfield="Spells 10104" prepared="Check Box 3076"/>
    <x:level number="8" index="6" formfield="Spells 10105" prepared="Check Box 3077"/>
    <x:level number="8" index="7" formfield="Spells 10106" prepared="Check Box 3078"/>

    <x:slots level="9" total="SlotsTotal 27" expended="SlotsRemaining 27"/>

    <x:level number="9" index="1" formfield="Spells 10108" prepared="Check Box 327"/>
    <x:level number="9" index="2" formfield="Spells 10107" prepared="Check Box 326"/>
    <x:level number="9" index="3" formfield="Spells 10109" prepared="Check Box 3079"/>
    <x:level number="9" index="4" formfield="Spells 101010" prepared="Check Box 3080"/>
    <x:level number="9" index="5" formfield="Spells 101011" prepared="Check Box 3081"/>
    <x:level number="9" index="6" formfield="Spells 101012" prepared="Check Box 3082"/>
    <x:level number="9" index="7" formfield="Spells 101013" prepared="Check Box 3083"/>

  </x:spells>

  <xsl:template name="proficiency-bonus">
    <xsl:param name="level"/>
    <xsl:value-of select="($level - 1) div 4 + 2"/>
  </xsl:template>

  <xsl:variable name="total-character-level">
    <xsl:call-template name="add-scattered-numbers-in-text">
      <xsl:with-param name="txt" select="/character/class-level/text()"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="proficiency-bonus">
    <xsl:call-template name="proficiency-bonus">
      <xsl:with-param name="level" select="$total-character-level"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="strength-score">
    <xsl:value-of select="number(/character/abilities/strength/text())"/>
  </xsl:variable>

  <xsl:variable name="dexterity-score">
    <xsl:value-of select="number(/character/abilities/dexterity/text())"/>
  </xsl:variable>

  <xsl:variable name="constitution-score">
    <xsl:value-of select="number(/character/abilities/constitution/text())"/>
  </xsl:variable>

  <xsl:variable name="intelligence-score">
    <xsl:value-of select="number(/character/abilities/intelligence/text())"/>
  </xsl:variable>

  <xsl:variable name="wisdom-score">
    <xsl:value-of select="number(/character/abilities/wisdom/text())"/>
  </xsl:variable>

  <xsl:variable name="charisma-score">
    <xsl:value-of select="number(/character/abilities/charisma/text())"/>
  </xsl:variable>  
  
  <xsl:variable name="strength-modifier">
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$strength-score"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="dexterity-modifier">
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$dexterity-score"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="constitution-modifier">
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$constitution-score"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="intelligence-modifier">
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$intelligence-score"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="wisdom-modifier">
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$wisdom-score"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="charisma-modifier">
    <xsl:call-template name="ability-modifier">
      <xsl:with-param name="score" select="$charisma-score"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:template name="skill-ability-modifier">
    <xsl:param name="ability"/>
    <xsl:choose>
      <xsl:when test="starts-with(lower-case($ability), 'str')">
	<xsl:value-of select="$strength-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($ability), 'dex')">
	<xsl:value-of select="$dexterity-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($ability), 'con')">
	<xsl:value-of select="$constitution-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($ability), 'int')">
	<xsl:value-of select="$intelligence-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($ability), 'wis')">
	<xsl:value-of select="$wisdom-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case($ability), 'cha')">
	<xsl:value-of select="$charisma-modifier"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:message>Unknown ability name</xsl:message>
	<xsl:value-of select="0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:variable name="spell-ability-modifier">
    <xsl:choose>
      <xsl:when test="starts-with(lower-case(/character/spellcasting/ability), 'str')">
	<xsl:value-of select="$strength-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case(/character/spellcasting/ability), 'dex')">
	<xsl:value-of select="$dexterity-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case(/character/spellcasting/ability), 'con')">
	<xsl:value-of select="$constitution-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case(/character/spellcasting/ability), 'int')">
	<xsl:value-of select="$intelligence-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case(/character/spellcasting/ability), 'wis')">
	<xsl:value-of select="$wisdom-modifier"/>
      </xsl:when>
      <xsl:when test="starts-with(lower-case(/character/spellcasting/ability), 'cha')">
	<xsl:value-of select="$charisma-modifier"/>
      </xsl:when>      
      <xsl:when test="matches(lower-case(/character/class-level), 'barbarian')">
	<xsl:value-of select="$wisdom-modifier"/>
      </xsl:when>      
      <xsl:when test="matches(lower-case(/character/class-level), 'bard')">
	<xsl:value-of select="$charisma-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'cleric')">
	<xsl:value-of select="$wisdom-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'druid')">
	<xsl:value-of select="$wisdom-modifier"/>
      </xsl:when>
      <!-- fighter is ambiguous: battle master can use str or dex, eldritch knight uses int; hopefully they chose explicitly above!  if not, assume eldritch knight -->
      <xsl:when test="matches(lower-case(/character/class-level), 'fighter')">
	<xsl:value-of select="$intelligence-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'monk')">
	<xsl:value-of select="$wisdom-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'paladin')">
	<xsl:value-of select="$charisma-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'ranger')">
	<xsl:value-of select="$wisdom-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'rogue')">
	<xsl:value-of select="$intelligence-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'sorcerer')">
	<xsl:value-of select="$charisma-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'warlock')">
	<xsl:value-of select="$charisma-modifier"/>
      </xsl:when>
      <xsl:when test="matches(lower-case(/character/class-level), 'wizard')">
	<xsl:value-of select="$intelligence-modifier"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:message> Unable to determine spellcasting ability </xsl:message>
	<xsl:value-of select="0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:template name="ability-modifier-field">
    <xsl:param name="name"/>
    <xsl:param name="score" select="10"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="concat(upper-case($name), 'mod')"/>
      <xsl:with-param name="value">
	<xsl:call-template name="signed-ability-modifier">
	  <xsl:with-param name="score" select="$score"/>
	</xsl:call-template>
      </xsl:with-param>
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

  <xsl:template name="proficiency-eligibility-multiplier">
    <xsl:param name="proficient"/>
    <xsl:choose>
      <xsl:when test="
		      lower-case(@proficient) = 'on' or
		      lower-case(@proficient) = 'true' or
		      lower-case(@proficient) = 'yes' or
		      number(@proficient) &gt;= 1
		      ">
	<xsl:value-of select="1"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="0"/>
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
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="$value != ''">
	    <xsl:value-of select="$value"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:variable name="proficient">
	      <xsl:call-template name="proficiency-eligibility-multiplier">
		<xsl:with-param name="proficient" select="$proficient"/>
	      </xsl:call-template>
	    </xsl:variable>
	    <xsl:variable name="save-ability-modifier">
	      <xsl:call-template name="skill-ability-modifier">
		<xsl:with-param name="ability" select="document('')//x:saving-throws/x:saving-throw[@ability=$name]/@ability"/>
	      </xsl:call-template>
	    </xsl:variable>
	    <xsl:call-template name="signed-number">
	      <xsl:with-param name="number" select="$proficient * $proficiency-bonus + $save-ability-modifier"/>
	    </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
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
    <xsl:variable name="skill-ability-modifier">
      <xsl:call-template name="skill-ability-modifier">
	<xsl:with-param name="ability" select="document('')//x:skills/x:skill[@name=$name]/@ability"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="proficient">
      <xsl:call-template name="proficiency-eligibility-multiplier">
	<xsl:with-param name="proficient" select="$proficient"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:skills/x:skill[@name=$name]/@formfield"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="$value != ''">
	    <xsl:value-of select="$value"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:call-template name="signed-number">
	      <xsl:with-param name="number">	    
		<xsl:choose>
		  <xsl:when test="
				  lower-case(@expertise) = 'on' or 
				  lower-case(@expertise) = 'true' or
				  lower-case(@expertise) = 'yes' or
				  number(@expertise) &gt;= 1
				  ">
		    <xsl:value-of select="2 * $proficient * $proficiency-bonus + $skill-ability-modifier"/>	    
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:value-of select="$proficient * $proficiency-bonus + $skill-ability-modifier"/>
		  </xsl:otherwise>
		</xsl:choose>
	      </xsl:with-param>
	    </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
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

  <xsl:template name="attack-ability-modifier">
    <xsl:param name="element"/>
    <xsl:choose>
      <xsl:when test="
		      lower-case($element/@melee) = 'on' or
		      lower-case($element/@melee) = 'true' or
		      lower-case($element/@melee) = 'yes' or
		      number($element/@melee) &gt;= 1
		      ">
	<xsl:choose>
	  <xsl:when test="
			  lower-case($element/@finesse) = 'on' or
			  lower-case($element/@finesse) = 'true' or
			  lower-case($element/@finesse) = 'yes' or
			  lower-case($element/@finesse) &gt;= 1
			  ">
	    <xsl:value-of select="$dexterity-modifier"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="$strength-modifier"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:when test="
		      lower-case($element/@ranged) = 'on' or
		      lower-case($element/@ranged) = 'true' or
		      lower-case($element/@ranged) = 'yes' or
		      number($element/@ranged) &gt;= 1
		      ">
	<xsl:choose>
	  <xsl:when test="
			  lower-case($element/@thrown) = 'on' or
			  lower-case($element/@thrown) = 'true' or
			  lower-case($element/@thrown) = 'yes' or
			  lower-case($element/@thrown) &gt;= 1
			  ">
	    <xsl:value-of select="$strength-modifier"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="$dexterity-modifier"/>
	  </xsl:otherwise>
	</xsl:choose>	
      </xsl:when>
      <xsl:when test="
		      lower-case($element/@spell) = 'on' or
		      lower-case($element/@spell) = 'true' or
		      lower-case($element/@spell) = 'yes' or
		      lower-case($element/@spell) &gt;= 1
		      ">
	<xsl:value-of select="$spell-ability-modifier"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="0"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
    
  <xsl:template name="attack-modifier">
    <xsl:param name="element"/>
    <xsl:variable name="ability-modifier">
      <xsl:call-template name="attack-ability-modifier">
	<xsl:with-param name="element" select="$element"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="proficiency-eligibility-multiplier">
      <xsl:call-template name="proficiency-eligibility-multiplier">
	<xsl:with-param name="proficient" select="$element/@proficient"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$proficiency-eligibility-multiplier * $proficiency-bonus + $ability-modifier"/>
  </xsl:template>

  <xsl:template name="attack-damage">
    <xsl:param name="element"/>
    <xsl:variable name="ability-modifier">
      <xsl:call-template name="attack-ability-modifier">
	<xsl:with-param name="element" select="$element"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:value-of select="$element/damage/@dice"/>
    <xsl:call-template name="implicit-signed-number">
      <xsl:with-param name="number" select="$ability-modifier"/>
    </xsl:call-template>
    <xsl:if test="$element/damage/@type != ''">
      <xsl:text> </xsl:text>
      <xsl:value-of select="$element/damage/@type"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="attacks">
    <xsl:comment>
      <xsl:text> computing attacks </xsl:text>
    </xsl:comment>
    <xsl:apply-templates select="attack[position() &lt; 4]"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name">
	<xsl:text>AttacksSpellcasting</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="value">
	<xsl:apply-templates select="attack[position() &gt; 3]"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="attacks/attack[position() &lt; 4]">
    <xsl:comment>
      <xsl:text> top attack </xsl:text>
      <xsl:value-of select="position()"/>
      <xsl:text> </xsl:text>
    </xsl:comment>
    <xsl:variable name="index" select="position()"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:attacks/x:attack[position()=$index]/@weapon"/>
      <xsl:with-param name="value" select="weapon-name/text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:attacks/x:attack[position()=$index]/@bonus"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="atk-bonus/text() != ''">
	    <xsl:value-of select="atk-bonus/text()"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:call-template name="explicit-signed-number">
	      <xsl:with-param name="number">
		<xsl:call-template name="attack-modifier">
		  <xsl:with-param name="element" select="."/>
		</xsl:call-template>
	      </xsl:with-param>
	    </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:attacks/x:attack[position()=$index]/@damage"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="damage/text() != ''">
	    <xsl:value-of select="damage/text()"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:call-template name="attack-damage">
	      <xsl:with-param name="element" select="."/>
	    </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="attacks/attack[position() &gt; 3]"> <!-- ?! -->
    <xsl:comment>
      <xsl:text> extra attack </xsl:text>
      <xsl:value-of select="position()"/>
      <xsl:text> </xsl:text>
    </xsl:comment>
    <xsl:value-of select="weapon-name/text()"/>
    <xsl:text>, </xsl:text>
    <xsl:choose>
      <xsl:when test="atk-bonus/text() != ''">
	<xsl:value-of select="atk-bonus/text()"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="explicit-signed-number">
	  <xsl:with-param name="number">
	    <xsl:call-template name="attack-modifier">
	      <xsl:with-param name="element" select="."/>
	    </xsl:call-template>
	  </xsl:with-param>
	</xsl:call-template>	
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>, </xsl:text>
    <xsl:choose>
      <xsl:when test="damage/text() != ''">
	<xsl:value-of select="damage/text()"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="attack-damage">
	  <xsl:with-param name="element" select="."/>
	</xsl:call-template>	
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#x0a;</xsl:text>
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
	<xsl:call-template name="signed-ability-modifier">
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
	<xsl:call-template name="signed-ability-modifier">
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

  <xsl:template match="spellcasting/ability | spellcasting/class">
    <xsl:variable name="x" select="name()"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:spells/*[local-name()=$x]/@formfield"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spellcasting/attack-bonus">
    <xsl:variable name="name" select="local-name()"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:spells/*[local-name()=$name]/@formfield"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="text() != ''">
	    <xsl:value-of select="text()"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:call-template name="signed-number">
	      <xsl:with-param name="number">
		<xsl:value-of select="$spell-ability-modifier + $proficiency-bonus"/>
	      </xsl:with-param>
	    </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="spellcasting/save-dc">
    <xsl:variable name="name" select="local-name()"/>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:spells/*[local-name()=$name]/@formfield"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="text() != ''">
	    <xsl:value-of select="text()"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="8 + $spell-ability-modifier + $proficiency-bonus"/>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
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
    <xsl:apply-templates>
      <xsl:with-param name="level" select="$level"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="spells/level/spell">
    <xsl:param name="level"/>
    <xsl:variable name="index" select="position() div 2"/> <!-- ?! -->
    <xsl:comment>
      <xsl:text> level </xsl:text>
      <xsl:value-of select="$level"/>
      <xsl:text> position </xsl:text>
      <xsl:value-of select="position()"/>
      <xsl:text> index </xsl:text>
      <xsl:value-of select="$index"/>
      <xsl:text> </xsl:text>
    </xsl:comment>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:spells/x:level[@number=$level][@index=$index]/@formfield"/>
      <xsl:with-param name="value" select="text()"/>
    </xsl:call-template>
    <xsl:call-template name="field">
      <xsl:with-param name="name" select="document('')//x:spells/x:level[@number=$level][@index=$index]/@prepared"/>
      <xsl:with-param name="value">
	<xsl:call-template name="checkbox">
	  <xsl:with-param name="value" select="@prepared"/>
	</xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="death-saves">
    <xsl:variable name="successes" select="@successes"/>
    <xsl:variable name="failures" select="@failures"/>
    <xsl:for-each select="document('')//x:death-saves/x:success[position() &lt;= $successes]">
      <xsl:call-template name="field">
	<xsl:with-param name="name" select="text()"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value">
	      <xsl:text>true</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
    <xsl:for-each select="document('')//x:death-saves/x:failure[position() &lt;= $failures]">
      <xsl:call-template name="field">
	<xsl:with-param name="name" select="text()"/>
	<xsl:with-param name="value">
	  <xsl:call-template name="checkbox">
	    <xsl:with-param name="value">
	      <xsl:text>true</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="initiative">
    <xsl:call-template name="single-word-field">
      <xsl:with-param name="name" select="name()"/>
      <xsl:with-param name="value">
	<xsl:choose>
	  <xsl:when test="text() != ''">
	    <xsl:value-of select="text()"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:call-template name="signed-ability-modifier">
	      <xsl:with-param name="score">
		<xsl:value-of select="$dexterity-score"/>
	      </xsl:with-param>
	    </xsl:call-template>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
