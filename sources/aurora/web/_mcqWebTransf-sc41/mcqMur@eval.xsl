<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:scOrigin="eu.scenari.gen.xslt.OriginSrc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="sc sp java op" extension-element-prefixes="scOrigin redirect" xmlns:op="utc.fr:ics/opale3" xmlns:java="http://xml.apache.org/xslt/java" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive" xmlns:redirect="com.scenari.xsldom.xalan.lib.Redirect"><xsl:output method="xml" indent="no" omit-xml-declaration="yes"/><xsl:param name="vAgent"/><xsl:param name="vDialog"/><xsl:variable name="vIdObj" select="concat(alphaHash(getIdNode(..)), '_Aeval')"/><xsl:template match="*"><script type="text/JavaScript">
var <xsl:value-of select="$vIdObj"/> = {

	fId : "<xsl:value-of select="alphaHash(getIdNode(..))"/>",
	fCurSeq : null,
	initSeq : function(pCodeSeq){
	try {
		if(pCodeSeq==null) return;
		if(this.fCurSeq!=null) this.closeSeq();
		this.fCurSeq = pCodeSeq;
		switch(this.fCurSeq) {

		case "init" : {
		var vForm = document.forms.<xsl:value-of select="$vIdObj"/>_form;
		for (var i=0; i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length; i++) {
			vForm.<xsl:value-of select="$vIdObj"/>_input[i].disabled = false;
			vForm.<xsl:value-of select="$vIdObj"/>_input[i].checked = false;
		}

var vLoadRespSession = "eval";
for (var i=0; i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length; i++) {
			var vInput = vForm.<xsl:value-of select="$vIdObj"/>_input[i];
			vInput.checked = scServices.assmntMgr.getResponse(this.fId, vLoadRespSession, vInput.value);
		}

		this.setSolution(false);
var vRespSession = "eval";
		if(scServices.assmntMgr.getCompletionStatus(this.fId, vRespSession)=="notAttempt") scServices.assmntMgr.setCompletionStatus(this.fId, vRespSession, "attempt");
		this.setResp = function(pInput, pIdx) {
			scServices.assmntMgr.setResponse(this.fId, vRespSession, pIdx, pInput.checked);

			this.computeScore();
			scServices.assmntMgr.commit();
		}				

		this.computeScore = function() {

			this.refreshScoresFeedbacks();
		}

if(vRespSession != vLoadRespSession) {
for (var i=0; i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length; i++) {
			var vInput = vForm.<xsl:value-of select="$vIdObj"/>_input[i];
			scServices.assmntMgr.setResponse(this.fId, vRespSession, vInput.value, vInput.checked);
		}
}
this.computeScore();

		scServices.assmntMgr.commit();
		break;
	}

		case "read" : {
		var vForm = document.forms.<xsl:value-of select="$vIdObj"/>_form;
		for (var i=0; i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length; i++) {
			vForm.<xsl:value-of select="$vIdObj"/>_input[i].disabled = true;
			vForm.<xsl:value-of select="$vIdObj"/>_input[i].checked = false;
		}

var vLoadRespSession = "eval";
for (var i=0; i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length; i++) {
			var vInput = vForm.<xsl:value-of select="$vIdObj"/>_input[i];
			vInput.checked = scServices.assmntMgr.getResponse(this.fId, vLoadRespSession, vInput.value);
		}

		this.setSolution(false);
this.setResp = function(pInput, pIdx) {

			this.computeScore();
			scServices.assmntMgr.commit();
		}	

		this.computeScore = function() {

			this.refreshScoresFeedbacks();
		}

this.computeScore();

		scServices.assmntMgr.commit();
		break;
	}

		}
	}catch(e){alert("failed:::"+e)};
	},

	closeSeq: function(){
		var vForm = document.forms.<xsl:value-of select="$vIdObj"/>_form;
		switch(this.fCurSeq) {

	case "init" : {

		break;
	}

	case "read" : {

		break;
	}

		}
		this.fCurSeq = null;
	},
	getOnLoadSeq:function() {

			if(scServices.assmntMgr.getCompletionStatus(this.fId, "eval") != "complete" &amp;&amp; true) return "init";

			return "read";

	return null;
	},

	refreshScoresFeedbacks : function(){
		

	},
	solIsShown : false,
	setSolution : function(pShown){
		var vTRs = null;
		var vForm = document.forms.<xsl:value-of select="$vIdObj"/>_form;
		var vTable = scPaLib.findNode("chi:" ,vForm);
		if (vTable.nodeName=="TABLE") vTRs = scPaLib.findNodes("chi:/chi:tr" ,vTable);
		else vTRs = scPaLib.findNodes("chi:" ,vTable);
	
		if(!pShown &amp;&amp; this.solIsShown) {
			for(var i=0; i&lt;vTRs.length; i++){
				var vTR = vTRs[i]; 
				var vOffs = vTR.className.indexOf("assmntSol");
				if(vOffs&gt;=0) vTR.className = vTR.className.substring(0, vOffs) + vTR.className.substring(vOffs+14);

			}
		} else if(pShown &amp;&amp; ! this.solIsShown) {

			var i = 0, vTR = null;
<xsl:for-each select="sc:choices/sc:choice">
			vTR = vTRs[i++];
			vTR.className = "<xsl:value-of select="si(@solution='checked', 'assmntSolCheck ', 'assmntSolUnche ')"/>" + vTR.className;
</xsl:for-each>
		}
		this.solIsShown = pShown;
	},
	onLoad: function(){
		this.initSeq(this.getOnLoadSeq()); 
		var vNodeRoot = sc$("<xsl:value-of select="$vIdObj"/>_A");
		vNodeRoot.style.display = "block"; 
	},
	onUnload: function(){
		this.closeSeq();
	},
	loadSortKey: "A",
	unloadSortKey: "A"
};

scOnLoads[scOnLoads.length] = <xsl:value-of select="$vIdObj"/>;
scOnUnloads[scOnUnloads.length] = <xsl:value-of select="$vIdObj"/>;
</script><div id="{$vIdObj}_A" style="display:none;"><div class="evalBody"><div class="question"><xsl:for-each select="sc:question"><xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/></xsl:for-each></div><scBlock class="response" aria-live="polite"><form action="" name="{$vIdObj}_form" id="{$vIdObj}_form"><ul class="choiceList "><xsl:for-each select="sc:choices/sc:choice"><xsl:variable name="vIndex" select="count(preceding-sibling::sc:choice)"/><xsl:variable name="vIdChoiceIn" select="concat($vIdObj, '_in', $vIndex)"/><xsl:variable name="vIdChoiceSol" select="concat($vIdObj, '_sol', $vIndex)"/><xsl:variable name="vIdChoiceLbl" select="concat($vIdObj, '_lbl', $vIndex)"/><li class="choiceList_ch "><div class="choiceList_in "><input type="checkbox" name="{$vIdObj}_input" id="{$vIdChoiceIn}" value="{$vIndex}" onclick="{$vIdObj}.setResp(this, {$vIndex});" aria-labelledby="{$vIdChoiceLbl}"/></div><div class="choiceList_la " id="{$vIdChoiceLbl}"><div class="choice"><div class="label"><xsl:for-each select="sc:choiceLabel"><xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/></xsl:for-each></div></div></div></li></xsl:for-each></ul></form></scBlock></div></div></xsl:template></xsl:stylesheet>
