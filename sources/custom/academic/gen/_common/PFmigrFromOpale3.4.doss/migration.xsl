<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sc="http://www.utc.fr/ics/scenari/v3/core"
    xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive" xmlns:op="utc.fr:ics/opale3">

	<xsl:output encoding="UTF-8" method="xml" indent="yes" />

     <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
	</xsl:template>
    
    <xsl:template name="setOAuid" match="op:pbTi">
        <xsl:param name="vType" select="substring(../name(),4)"></xsl:param>
        <xsl:param name="vAncestor" select="ancestor::sp:pb/preceding-sibling::*[substring(name(), string-length(name())) = 'M']/sp:title"></xsl:param>
        <xsl:param name="vPageTitle" select="lower-case(translate(translate($vAncestor, ' ', '_'),'''',''))"></xsl:param>
        <xsl:param name="vCount" select="count(../preceding-sibling::*)+1"></xsl:param>
        
        <op:pbTi>
            <xsl:apply-templates select="node()|@*"/>
            <xsl:choose>
                <xsl:when test="sp:OAuid/op:OAuid/sp:OAuid !=''">
                    <!--<xsl:value-of select="."></xsl:value-of>  -->                              
                </xsl:when>
                <xsl:otherwise>
                <sp:OAuid>
                    <op:OAuid>
                        <sp:OAuid>
                            <xsl:value-of select="$vPageTitle"></xsl:value-of>
                            <xsl:value-of select="concat('/',$vType,'_',$vCount)"></xsl:value-of>
                        </sp:OAuid>
                    </op:OAuid>
                </sp:OAuid>
                </xsl:otherwise>
            </xsl:choose>	
        </op:pbTi>
    </xsl:template>
</xsl:stylesheet>
