<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:scOrigin="eu.scenari.gen.xslt.OriginSrc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="sc sp java op" extension-element-prefixes="scOrigin redirect" xmlns:op="utc.fr:ics/opale3" xmlns:java="http://xml.apache.org/xslt/java" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core" xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive" xmlns:redirect="com.scenari.xsldom.xalan.lib.Redirect">
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes"/>
	<xsl:param name="vAgent"/>
	<xsl:param name="vDialog"/>
	<xsl:variable name="vIdObj" select="concat(alphaHash(getIdNode(..)), '_Asol')"/>
	<xsl:template match="*">
		<script type="text/JavaScript">
var <xsl:value-of select="$vIdObj"/> = {

	fId : "<xsl:value-of select="alphaHash(getIdNode(..))"/>",
	fCurSeq : null,
	initSeq : function(pCodeSeq){
	try {
		if(pCodeSeq==null) return;
		if(this.fCurSeq!=null) this.closeSeq();
		this.fCurSeq = pCodeSeq;
		switch(this.fCurSeq) {

		case "" : {
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
var vLoadScoreSession = "eval";
		this.fMinPts = scServices.assmntMgr.getMinPts(this.fId, vLoadScoreSession);
		this.fScorePts = scServices.assmntMgr.getScorePts(this.fId, vLoadScoreSession);
		this.fMaxPts = scServices.assmntMgr.getMaxPts(this.fId, vLoadScoreSession);

		this.setSolution(true);
scAssmntMgr.setMode(sc$("<xsl:value-of select="$vIdObj"/>_N_responseTi"), "visible");
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

	case "" : {

		break;
	}

		}
		this.fCurSeq = null;
	},
	getOnLoadSeq:function() {

			return "";

	return null;
	},

	refreshScoresFeedbacks : function(){
		

		var vScoreNode = sc$("<xsl:value-of select="$vIdObj"/>_SN42");

		var vStep = 1;
		var vScore = Math.round(this.fScorePts / vStep);
		function scoreStr(pVal){
			return new Number(pVal).toFixed(0);
		}
if(vScore &lt;= 0 &amp;&amp; true) {
			vScoreNode.innerHTML = "Votre réponse est incorrecte."+"";
			vScoreNode.className = "answWorst";
		} else if(true) {
			vScoreNode.innerHTML = "Votre réponse est juste."+"";
			vScoreNode.className = "answBest";
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

			var i = 0, vTR = null;
<xsl:for-each select="sc:choices/sc:choice">
			var vSol = vForm.<xsl:value-of select="$vIdObj"/>_sol[i];
			scAssmntMgr.setMode(vSol.parentNode, "visible");
			vSol.checked = <xsl:value-of select="si(@solution='checked', 'true', 'false')"/>;
			vForm.<xsl:value-of select="$vIdObj"/>_input[i].setAttribute("aria-hidden", "true");

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
</script>
		<div id="{$vIdObj}_A" style="display:none;">
			<div class="solBody">
				<xsl:choose>
					<xsl:when test="sc:question">
						<scBlock class="question">
							<hx class="question_ti">
								<span>Énoncé</span>
							</hx>
							<xsl:for-each select="sc:question">
								<xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/>
							</xsl:for-each>
						</scBlock>
					</xsl:when>
				</xsl:choose>
				<scBlock class="score">
					<hx class="score_ti">
						<span>Résultat</span>
					</hx>
					<div class="scoreEval " aria-live="polite">
						<div id="{$vIdObj}_SN42">
							<span/>
						</div>
					</div>
				</scBlock>
				<scBlock class="sol">
					<hx class="sol_ti">
						<span>Correction</span>
					</hx>
					<div id="{$vIdObj}_N_responseTi" class="response_ti">
						<span aria-hidden="true">
							<span>Votre choix</span>
						</span>
						<span>
							<span>Choix attendu</span>
						</span>
						<span aria-hidden="true">
							<span>Réponse</span>
						</span>
					</div>
					<form action="" name="{$vIdObj}_form" id="{$vIdObj}_form">
						<ul class="choiceList ">
							<xsl:for-each select="sc:choices/sc:choice">
								<xsl:variable name="vIndex" select="count(preceding-sibling::sc:choice)"/>
								<xsl:variable name="vIdChoiceIn" select="concat($vIdObj, '_in', $vIndex)"/>
								<xsl:variable name="vIdChoiceSol" select="concat($vIdObj, '_sol', $vIndex)"/>
								<xsl:variable name="vIdChoiceLbl" select="concat($vIdObj, '_lbl', $vIndex)"/>
								<li class="choiceList_ch ">
									<div class="choiceList_in ">
										<input type="checkbox" name="{$vIdObj}_input" id="{$vIdChoiceIn}" value="{$vIndex}" onclick="{$vIdObj}.setResp(this, {$vIndex});" aria-labelledby="{$vIdChoiceLbl}"/>
									</div>
									<div class="choiceList_sol " style="display:none;">
										<input type="checkbox" name="{$vIdObj}_sol" id="{$vIdChoiceSol}" value="" disabled="true" aria-labelledby="{$vIdChoiceLbl}"/>
									</div>
									<div class="choiceList_la " id="{$vIdChoiceLbl}">
										<div class="choice">
											<div class="label">
												<xsl:for-each select="sc:choiceLabel">
													<xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/>
												</xsl:for-each>
											</div>
											<xsl:for-each select="sc:choiceExplanation">
												<div class="choiceExplain ">
													<xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/>
												</div>
											</xsl:for-each>
										</div>
									</div>
								</li>
							</xsl:for-each>
						</ul>
					</form>
				</scBlock>
				<xsl:choose>
					<xsl:when test="sc:globalExplanation">
				<scBlock class="explain">
					<hx class="explain_ti">
						<span>Explications</span>
					</hx>
					<xsl:for-each select="sc:globalExplanation">
						<div aria-live="polite">
							<xsl:value-of select="resultatAgent(concat('@', si(@sc:refUri, getIdFromPath(@sc:refUri), getIdNode(.)), '/xhtmlContent'))" disable-output-escaping="yes"/>
						</div>
					</xsl:for-each>
				</scBlock>
					</xsl:when>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>