<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" xmlns:redirect="com.scenari.xsldom.xalan.lib.Redirect" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" extension-element-prefixes="redirect" exclude-result-prefixes="sc xhtml" version="1.0">
	<xsl:output omit-xml-declaration="yes" indent="no" method="xml"/>
	<xsl:param name="vDialog"/>
	<xsl:param name="vAgent"/>
	<xsl:template match="treeContent">
		<ul class="mnu static">
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
	<xsl:template match="entry">
		<xsl:variable name="vOutlineClasses" select="computeStrDialog(concat(@dialog, '/outlineClasses'))"/>
		<xsl:variable name="vUrl" select="computeStrDialog(string(@dialog), 'act:')"/>
		<xsl:variable name="vDepth" select="count(ancestor::entry)"/>
		<xsl:variable name="vIsSel" select="containWord('current',@position)"/>
		<xsl:variable name="vIsAnc" select="containWord('parent ancestor',@position)"/>
		<xsl:if test="$vOutlineClasses != 'hidden'">
			<li class="sel_{if($vIsSel, 'yes', 'no')} anc_{if($vIsAnc, 'yes', 'no')} type_{if(entry,'b','l')} {if(entry and not(descendant::entry/@position='current' or @position='current'),' type_b_c','')} dpt_{$vDepth} {$vOutlineClasses}">
				<div class="lbl type_{if(entry,'b','l')}" id="{$vUrl}">
					<xsl:variable name="vSubUrl" select="computeStrDialog(string(entry[1]/@dialog), 'act:')"/>
					<xsl:if test="$vIsSel">
						<addClassToBody class="{$vOutlineClasses}"/>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="$vIsSel or $vIsAnc and $vSubUrl = $vUrl">
							<span class="item">
								<span>
									<xsl:value-of select="@title"/>
								</span>
							</span>
						</xsl:when>
						<xsl:otherwise>
							<a href="{$vUrl}" target="_self" class="item">
								<xsl:if test="$vIsAnc">
									<xsl:attribute name="type">up</xsl:attribute>
								</xsl:if>
								<span>
									<xsl:value-of select="@title"/>
								</span>
							</a>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<xsl:if test="entry and (descendant::entry/@position='current' or $vIsSel)">
					<ul class="sub mnu_open">
						<xsl:apply-templates/>
					</ul>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="node()"/>
</xsl:stylesheet>