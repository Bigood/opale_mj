<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" xmlns:redirect="com.scenari.xsldom.xalan.lib.Redirect" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" extension-element-prefixes="redirect" exclude-result-prefixes="sc xhtml" version="1.0">
	<xsl:output omit-xml-declaration="yes" indent="no" method="xml"/>
	<xsl:param name="vDialog"/>
	<xsl:param name="vAgent"/>
	<xsl:template match="treeContent">
		<ul class="mnu">
			<xsl:apply-templates/>
		</ul>
	</xsl:template>
	<xsl:template match="entry">
		<xsl:variable name="vOutlineClasses" select="computeStrDialog(concat(@dialog, '/outlineClasses'))"/>
		<xsl:variable name="vDescription" select="computeStrDialog(concat(@dialog, '/description'))"/>
		<xsl:variable name="vUrl" select="computeStrDialog(string(@dialog), 'act:')"/>
		<xsl:variable name="vDepth" select="count(ancestor::entry)"/>
		<xsl:variable name="vIsAnc" select="containWord('parent ancestor',@position)"/>
		<xsl:if test="$vOutlineClasses != 'hidden'">
			<li class="anc_{if($vIsAnc, 'yes', 'no')} {$vOutlineClasses}" data-position="{@position}">
				<div class="lbl">
					<xsl:variable name="vSubUrl" select="computeStrDialog(string(entry[1]/@dialog), 'act:')"/>
					<xsl:choose>
						<xsl:when test="$vIsAnc">
							<span class="item">
								<span>
									<xsl:value-of select="@title"/>
								</span>
							</span>
						</xsl:when>
						<xsl:otherwise>
							<a href="{$vUrl}" target="_self" class="item">
								<xsl:choose>
									<xsl:when test="count(preceding-sibling::entry)=0">
										<xsl:attribute name="type">index</xsl:attribute>
									</xsl:when>
									<xsl:when test="count(preceding-sibling::entry)=1">
										<xsl:attribute name="type">first</xsl:attribute>
									</xsl:when>
								</xsl:choose>
								<xsl:if test="boolean(genProp('addDescTitlesToToolMenuLinks-bool', 'true'))">
									<xsl:attribute name="title">
										<xsl:value-of select="$vDescription"/>
									</xsl:attribute>
								</xsl:if>
								<span>
									<xsl:value-of select="@title"/>
								</span>
							</a>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="node()"/>
</xsl:stylesheet>