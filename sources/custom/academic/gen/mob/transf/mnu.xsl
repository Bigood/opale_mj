<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" xmlns:redirect="com.scenari.xsldom.xalan.lib.Redirect" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" extension-element-prefixes="redirect" exclude-result-prefixes="sc xhtml" version="1.0">
	<xsl:output omit-xml-declaration="yes" indent="no" method="xml"/>
	<xsl:param name="vDialog"/>
	<xsl:param name="vAgent"/>
	<xsl:template match="treeContent">
		<ul class="mnu mnu_static  mnu_sch_no">
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
	<xsl:template match="entry">
		<xsl:variable name="vOutlineClasses" select="resultatDialogue(concat(@dialog, '/outlineClasses'))"/>
		<xsl:variable name="vUrl" select="resultatDialogue(string(@dialog), 'act:')"/>
		<xsl:variable name="vDepth" select="count(ancestor::entry)"/>
		<xsl:if test="$vUrl != 'outline.xml'">
			<li class="mnu_{si(entry,'b','l')} mnu_dpt_{$vDepth} {$vOutlineClasses}">
				<div class="mnuLbl mnu_{si(entry,'b','l')} mnu_dpt_{$vDepth} {$vOutlineClasses} mnu_sch_no" id="{$vUrl}">
					<xsl:variable name="vSubUrl" select="resultatDialogue(string(entry[1]/@dialog), 'act:')"/>
					<a href="{$vUrl}" target="_self" class="mnu_i mnu_lnk">
						<span class="mnu_sch">
								<xsl:value-of select="@title"/>
						</span>
					</a>
				</div>
			</li>
		</xsl:if>
		<xsl:if test="$vUrl = 'outline.xml'">
			<li class="mnu_{si(entry,'b','l')} mnu_dpt_{$vDepth} {$vOutlineClasses}">
				<div class="mnuLbl mnu_{si(entry,'b','l')} mnu_dpt_{$vDepth} {$vOutlineClasses} mnu_sch_no" id="{$vUrl}">
					<xsl:variable name="vSubUrl" select="resultatDialogue(string(entry[1]/@dialog), 'act:')"/>
					<a href="{$vUrl}" target="_self" class="mnu_i mnu_lnk">
						<span class="mnu_sch">
								<xsl:value-of select="@title"/>
						</span>
					</a>
				</div>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="node()"/>
</xsl:stylesheet>