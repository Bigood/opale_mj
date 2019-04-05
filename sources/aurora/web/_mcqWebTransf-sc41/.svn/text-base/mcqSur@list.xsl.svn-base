<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:scOrigin="eu.scenari.gen.xslt.OriginSrc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="sc sp java op" extension-element-prefixes="scOrigin redirect" xmlns:op="utc.fr:ics/opale3" xmlns:java="http://xml.apache.org/xslt/java" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive" xmlns:redirect="com.scenari.xsldom.xalan.lib.Redirect"><xsl:output method="xml" indent="no" omit-xml-declaration="yes"/><xsl:param name="vAgent"/><xsl:param name="vDialog"/><xsl:variable name="vIdObj" select="concat(alphaHash(getIdNode(..)), '_Alist')"/><xsl:template match="*"><script type="text/JavaScript">
var <xsl:value-of select="$vIdObj"/> = {

	fId : "<xsl:value-of select="alphaHash(getIdNode(..))"/>",
	fCurSeq : null,
	initSeq : function(pCodeSeq){
	try {
		if(pCodeSeq==null) return;
		if(this.fCurSeq!=null) this.closeSeq();
		this.fCurSeq = pCodeSeq;
		switch(this.fCurSeq) {

		case "play" : {
		var vForm = document.forms.<xsl:value-of select="$vIdObj"/>_form;
		for (var i=0; i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length; i++) {
			vForm.<xsl:value-of select="$vIdObj"/>_input[i].disabled = false;
			vForm.<xsl:value-of select="$vIdObj"/>_input[i].checked = false;
		}

var vLoadRespSession = "";
var vResp = scServices.assmntMgr.getResponse(this.fId, vLoadRespSession, "choice");
		if(vResp != null) sc$("<xsl:value-of select="$vIdObj"/>_in"+vResp).checked = true;

		this.setSolution(false);
scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N_globalExp"), "collapsed");
scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N_responseTi"), "invisible");
<xsl:for-each select="sc:choices/sc:choice">scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N<xsl:value-of select="count(preceding-sibling::sc:choice)"/>_choiceExp"), "visible");
</xsl:for-each>scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N_score"), "invisible");
var vRespSession = "";
		if(scServices.assmntMgr.getCompletionStatus(this.fId, vRespSession)=="notAttempt") scServices.assmntMgr.setCompletionStatus(this.fId, vRespSession, "attempt");
		this.setResp = function(pInput, pIdx) {
			scServices.assmntMgr.setResponse(this.fId, vRespSession, "choice", pIdx);

			this.computeScore();
			scServices.assmntMgr.commit();
		}				

		this.computeScore = function() {

		this.fMinPts = <xsl:value-of select="si(sc:solution/@pointsIfWrong, sc:solution/@pointsIfWrong, 0)"/>;
		this.fMaxPts = <xsl:value-of select="si(sc:solution/@pointsIfRight, sc:solution/@pointsIfRight , 1)"/>;
		this.fScorePts = document.forms.<xsl:value-of select="$vIdObj"/>_form.<xsl:value-of select="$vIdObj"/>_input[<xsl:value-of select="sc:solution/@choice - 1"/>].checked ?  this.fMaxPts : this.fMinPts;

				this.fScorePts = 0 + (this.fScorePts-this.fMinPts) / (this.fMaxPts-this.fMinPts) * (1 - 0); 

			this.fMinPts = 0;

			this.fMaxPts = 1;

		//alert("score:::::"+this.fMinPts+" - "+this.fScorePts+" - "+this.fMaxPts);
var vScoreSession = "";
		if(this.fScorePts != null) scServices.assmntMgr.setPts(this.fId, vScoreSession, this.fMinPts, this.fScorePts, this.fMaxPts);

			this.refreshScoresFeedbacks();
		}

if(vRespSession != vLoadRespSession) {
for(var i = 0; i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length; i++) if(vForm.<xsl:value-of select="$vIdObj"/>_input[i].checked) break;
		scServices.assmntMgr.setResponse(this.fId, vRespSession, "choice", (i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length) ? vForm.<xsl:value-of select="$vIdObj"/>_input[i].value : null);
}
this.computeScore();

		scServices.assmntMgr.commit();
		break;
	}

		}
	}catch(e){alert("failed:::"+e)};
	},
	fct_play : function(){
this.initSeq("play");

	},
	fct_displaySol : function(){
var vForm=document.forms.<xsl:value-of select="$vIdObj"/>_form; for (var i=0; i &lt; vForm.<xsl:value-of select="$vIdObj"/>_input.length; i++) vForm.<xsl:value-of select="$vIdObj"/>_input[i].disabled = true; this.setSolution(true); scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N_globalExp"), "visible");
scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N_chExpln"), "visible");
scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N_score"), "visible");
scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N_responseTi"), "visible");

	},
	fct_reset : function(){
var vSess="";
scServices.assmntMgr.resetResponses(this.fId, vSess);
scServices.assmntMgr.setPts(this.fId, vSess, null, null, null); 
this.initSeq("play");

	},

	closeSeq: function(){
		var vForm = document.forms.<xsl:value-of select="$vIdObj"/>_form;
		switch(this.fCurSeq) {

	case "play" : {

		break;
	}

		}
		this.fCurSeq = null;
	},
	getOnLoadSeq:function() {

			return "play";

	return null;
	},

	refreshScoresFeedbacks : function(){
		

		var vScoreNode = sc$("<xsl:value-of select="$vIdObj"/>_SNa4");

		var vScore = (Math.round((this.fScorePts-this.fMinPts) / (this.fMaxPts-this.fMinPts) * 100) * 1)+ 0;
if(vScore &gt; 99 &amp;&amp; true) {
			vScoreNode.innerHTML = "&lt;span&gt;"  + "Bonne réponse&lt;\/span&gt;";
			vScoreNode.className = "answBest";
		} else if(vScore &gt; 49 &amp;&amp; vScore &lt;= 99 &amp;&amp; true) {
			vScoreNode.innerHTML = "&lt;span&gt;" + vScore + "% de bonnes réponses&lt;\/span&gt;";
			vScoreNode.className = "answGood";
		} else if(vScore &gt; 0 &amp;&amp; vScore &lt;= 49 &amp;&amp; true) {
			vScoreNode.innerHTML = "&lt;span&gt;" + vScore + "% de bonnes réponses&lt;\/span&gt;";
			vScoreNode.className = "answBad";
		} else if(vScore &lt;= 0 &amp;&amp; true) {
			vScoreNode.innerHTML = "&lt;span&gt;"  + "Mauvaise réponse &lt;\/span&gt;";
			vScoreNode.className = "answWorst";
		} else  {
			vScoreNode.innerHTML = "";
			vScoreNode.className = "";
		}

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

				var vSol = vForm.<xsl:value-of select="$vIdObj"/>_sol[i];
				scAssmntMgr.setMode(vSol.parentNode, "collapsed");
				vSol.checked = false;
				vForm.<xsl:value-of select="$vIdObj"/>_input[i].removeAttribute("aria-hidden");

			}
		} else if(pShown &amp;&amp; ! this.solIsShown) {

			for(var i=0; i&lt;vTRs.length; i++){
				var vTR = vTRs[i]; 
				vTR.className = ( i+1 == <xsl:value-of select="sc:solution/@choice"/> ? "assmntSolRight " : "assmntSolWrong ") + vTR.className;

				var vSol = vForm.<xsl:value-of select="$vIdObj"/>_sol[i];
				scAssmntMgr.setMode(vSol.parentNode, "visible");
				vSol.checked = (i+1 == <xsl:value-of select="sc:solution/@choice"/>);
				vForm.<xsl:value-of select="$vIdObj"/>_input[i].setAttribute("aria-hidden", "true");

			}

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
</script><div id="{$vIdObj}_A" style="display:none;"><div class="quizBody"><div class="question"><scOrigin:addContextNode/><xsl:for-each select="sc:question"><xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/></xsl:for-each></div><scBlock class="response" aria-live="polite"><hx id="{$vIdObj}_N_responseTi" class="response_ti"><span aria-hidden="true"><span>Votre choix</span></span><span><span>Choix attendu</span></span><span aria-hidden="true"><span>Réponse</span></span></hx><form action="" name="{$vIdObj}_form" id="{$vIdObj}_form"><ul class="choiceList "><xsl:for-each select="sc:choices/sc:choice"><xsl:variable name="vIndex" select="count(preceding-sibling::sc:choice)"/><xsl:variable name="vIdChoiceIn" select="concat($vIdObj, '_in', $vIndex)"/><xsl:variable name="vIdChoiceSol" select="concat($vIdObj, '_sol', $vIndex)"/><xsl:variable name="vIdChoiceLbl" select="concat($vIdObj, '_lbl', $vIndex)"/><li class="choiceList_ch "><div class="choiceList_in "><input type="radio" name="{$vIdObj}_input" id="{$vIdChoiceIn}" value="{$vIndex}" onclick="{$vIdObj}.setResp(this, {$vIndex});" aria-labelledby="{$vIdChoiceLbl}"/></div><div class="choiceList_sol " style="display:none;"><input type="radio" name="{$vIdObj}_sol" id="{$vIdChoiceSol}" value="" disabled="true" aria-labelledby="{$vIdChoiceLbl}"/></div><div class="choiceList_la " id="{$vIdChoiceLbl}"><div class="choice"><div class="label"><xsl:for-each select="sc:choiceLabel"><xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/></xsl:for-each></div><xsl:for-each select="sc:choiceExplanation"><div class="choiceExp " id="{$vIdObj}_N{$vIndex}_choiceExp"><xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/></div></xsl:for-each></div></div></li></xsl:for-each></ul></form></scBlock><xsl:for-each select="sc:globalExplanation"><div class="globalExp " id="{$vIdObj}_N_globalExp" aria-live="polite"><scOrigin:addContextNode/><xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/></div></xsl:for-each><div class="toolbar"><span class="scoreBox"><span class="score " aria-live="polite" id="{$vIdObj}_N_score"><span id="{$vIdObj}_SNa4"><span/></span></span></span></div></div></div></xsl:template></xsl:stylesheet>
