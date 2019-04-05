<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="sc sp">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="vDialog"/>
	<xsl:param name="vAgent"/>
	<xsl:template match="*">
		<mediaAttributes data-alt-otherencoding="{if(//sp:otherEncoding,getUrl(gotoSubModel(//sp:otherEncoding),'nav'),'no')}" data-alt-istranscript="{if(//sp:transcript,'yes','no')}" data-alt-transcriptinfosdoc="{if(typeAgent(concat('@',gotoSubModel(//sp:transcriptTxt)))='sfile_pdf' or typeAgent(concat('@',gotoSubModel(//sp:transcriptTxt)))='sfile_rtf',getContent(gotoMeta(gotoSubModel(//sp:transcriptTxt))),'no')}" data-alt-transcript="{if(typeAgent(concat('@',gotoSubModel(//sp:transcriptTxt)))='sfile_pdf' or typeAgent(concat('@',gotoSubModel(//sp:transcriptTxt)))='sfile_rtf',getUrl(gotoSubModel(//sp:transcriptTxt),'nav'),'text')}" data-alt-audiodesc="{if(//sp:audioDesc,getUrl(gotoSubModel(//sp:audioDesc),'nav'),'no')}" data-alt-audiodesctype="{if(//sp:audioDesc,typeAgent(concat('@',gotoSubModel(//sp:audioDesc))),'no')}" data-alt-altvideo="{if(//sp:altVideo,getUrl(gotoSubModel(//sp:altVideo),'nav'),'no')}">
			<xsl:attribute name="data-subtitles">
				<xsl:choose>
					<xsl:when test="//sp:subTitles">{"subtitles":[<xsl:for-each select="//sp:subTitles">{"lang":"<xsl:value-of select="sp:lang"/>","url":"<xsl:value-of select="getUrl(gotoSubModel(sp:subTitle),'nav')"/>"}<xsl:value-of select="if(following-sibling::sp:subTitles,',')"/>
						</xsl:for-each>]}</xsl:when>
					<xsl:otherwise>no</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</mediaAttributes>
	</xsl:template>
</xsl:stylesheet>