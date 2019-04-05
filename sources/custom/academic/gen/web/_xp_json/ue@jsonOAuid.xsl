<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" xmlns:redirect="com.scenari.xsldom.xalan.lib.Redirect" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java" xmlns:xalan="http://xml.apache.org/xalan" extension-element-prefixes="redirect" exclude-result-prefixes="sc java xhtml" version="1.0">
	<xsl:output omit-xml-declaration="yes" indent="no" method="text"/>
	<xsl:param name="vDialog"/>
	<xsl:param name="vAgent"/>
	<xsl:template match="*">{OAuids:{
		<xsl:if test="getEntryBuffer('OAuidBuffer')">
			<xsl:for-each select="xalan:nodeset(java:keySet(getEntryBuffer('OAuidBuffer')))">{"id":"<xsl:value-of select="string(.)"/>",<xsl:value-of select="getEntryBuffer('subPageReg', string(.))"/>},</xsl:for-each>{"null":"null"}</xsl:if>}}
	</xsl:template>
	<xsl:template match="node()"/>
</xsl:stylesheet>