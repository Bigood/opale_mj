/* === Opale scrom manager ================================================== */
var scormMgr = {
	fPathHomeBody : "bod:.home",
	fPathPageBody : "bod:.default",
	fPathMenu : "ide:menu",
	fPathBtnQuitParent : "ide:tools",
	fPathBtnQuitParentHome : "ide:navigation",
	fPathBtnNavParentHome : "ide:navigation/chi:ul",
	fFilterExcludedAutoSeenPages : scPaLib.compileFilter(".assmntUa|.courseUa|.ueDiv"),
	fFilterModulePage : scPaLib.compileFilter(".module"),

	fStrings : ["￼Quiter￼","￼Quiter ce module￼",
	/*02*/      "￼page vue￼","￼page non vue￼",
	/*04*/      "￼Marquer la page '%s' non vue￼","￼Marquer la page '%s' vue￼",
	/*06*/      "￼Ouvrir la dernière page consultée￼",""],

	/* === Public ============================================================= */
	init : function () {
		try {
			//scCoLib.util.log("scormMgr.init");
			if (!scServices.markedPages) throw "Cannot find scServices.markedPages";
			this.fPageBody = scPaLib.findNode(this.fPathPageBody);
			if (this.fPageBody){ // Normal page
				this.xAddBtn(scDynUiMgr.addElement("span",scPaLib.findNode(this.fPathBtnQuitParent),"scormQuit"), "btnScormQuit", this.fStrings[0], this.fStrings[1]).onclick = this.quit.bind(this);
				this.fIsModulePage = scPaLib.checkNode(this.fFilterModulePage, this.fPageBody);
			} else if (scPaLib.findNode(this.fPathHomeBody)){ // Home page
				this.xAddBtn(scDynUiMgr.addElement("span",scPaLib.findNode(this.fPathBtnQuitParentHome),"scormQuit"), "btnScormQuit", this.fStrings[0], this.fStrings[1]).onclick = this.quit.bind(this);
				this.fIsHomePage = true;
			}
			scOnLoads[scOnLoads.length] = this;
			scOnUnloads[scOnUnloads.length] = this;
			
		} catch(e) {
			alert("scormMgr init failed: "+e);
		}
	},

	/** scCoLib OnLoad  */
	onLoad: function() {
		//scCoLib.util.log("scormMgr.onLoad");
		
		if (this.fIsModulePage){
			this.fMenu = scPaLib.findNode(this.fPathMenu);
			if (!scPaLib.checkNode(this.fFilterExcludedAutoSeenPages, this.fPageBody)) this.xSetSeenStatus(scServices.markedPages.getIdFromUrl(scCoLib.hrefBase()), true);
			this.updateMenu();
		
			// == Refresh du completion storage. Commit si première affectation ======
			if (scServices.completionStorage) scServices.completionStorage.commit((!scServices.completionStorage.getSavedCompletionStatus() || scServices.completionStorage.getSavedCompletionStatus()=="not attempted") ? true : undefined);
		} else if (this.fIsHomePage){
			var vBtnNavParent = scPaLib.findNode(this.fPathBtnNavParentHome);
			if(scServices.locationStorage && scServices.locationStorage.getLocation()) {
				this.xAddBtn(scDynUiMgr.addElement("li",vBtnNavParent), "btnScormResume", this.fStrings[6]).onclick = this.resume.bind(this);
			}
		}
	},
	loadSortKey : "BB",

	/** scCoLib onUnload  */
	onUnload: function() {
		//scCoLib.util.log("scormMgr.onUnload");

		if (this.fIsModulePage){
			// == Commit scorm lors de la fermeture des pages ========================
			// # Compute de certaines valeurs scorm
			if(scServices.exitModeStorage) scServices.exitModeStorage.commitSessionTime();
			// # Commit
			if(scServices.scorm2k4 && scServices.scorm2k4.isScorm2k4Active()) {
				var vApi = scServices.scorm2k4.getScorm2k4API();
				vApi.Commit("");
			} else if(scServices.scorm12 && scServices.scorm12.isScorm12Active()) {
				var vApi = scServices.scorm12.getScorm12API();
				vApi.LMSCommit("");
			}
		}
	},
 	unloadSortKey : "ZZ",

	declareQuitPage : function(pUrl){
		this.fQuitPAgeUrl = pUrl;
	},

	buildSeenBtn : function(pParent, pUrl, pLabel) {
		var vSeenBtn = this.xAddBtn(scDynUiMgr.addElement("span",pParent,"scormSeen"), "btnScormSeen", this.fStrings[3], this.fStrings[5].replace("%s",pLabel));
		vSeenBtn.onclick = this.sToggleSeen;
		vSeenBtn.fId = scServices.markedPages.getIdFromUrl(pUrl);
		vSeenBtn.fLbl = pParent;
		vSeenBtn.fLblText = pLabel;
		return vSeenBtn;
	},

	toggleSeen : function(pId, pSeen){
		//scCoLib.util.log("scormMgr.toggleSeen");
		if (!pId) pId = scServices.markedPages.getIdFromUrl(scCoLib.hrefBase());
		if (typeof pSeen == "undefined") pSeen = !scServices.markedPages.isPageMarkedId(pId);
		this.xSetSeenStatus(pId, pSeen);
		this.updateMenu();
	},

	updateMenu : function(){
		if (!this.fMenu) return;
		//scCoLib.util.log("scormMgr.updateMenu");
		this.fMenuSeenBtns = scPaLib.findNodes("des:a.btnScormSeen", this.fMenu);
		for (var i=0; i < this.fMenuSeenBtns.length; i++){
			var vMenuSeenBtn = this.fMenuSeenBtns[i];
			var vIsSeen = scServices.markedPages.isPageMarkedId(vMenuSeenBtn.fId);
			tplMgr.switchClass(vMenuSeenBtn, "scormSeen_", "scormSeen_"+vIsSeen, true, false);
			vMenuSeenBtn.title = this.fStrings[vIsSeen ? 4 : 5].replace("%s", vMenuSeenBtn.fLblText);
			vMenuSeenBtn.innerHTML = '<span>'+this.fStrings[vIsSeen ? 2 : 3]+'</span>';
		}
	},
	
	quit : function(){
		if (this.fQuitPAgeUrl) window.location.href = this.fQuitPAgeUrl;
	},

	reset : function(){
		scServices.storage.resetData(); 
		window.location.reload();
		return false;
	},

	resume : function(){
		scServices.scLoad.loadFromRoot(scServices.locationStorage.getLocation());
		return false;
	},

	/* === Callbacks ========================================================== */
	sToggleSeen : function() {
		try{
			scormMgr.toggleSeen(this.fId);
		} catch(e){}
		return false;
	},

	/* === Private ============================================================ */
	xSetSeenStatus : function(pId, pSeen) {
		//scCoLib.util.log("scormMgr.xSetSeenStatus");
		if (pSeen) scServices.markedPages.addPageMarkedId(pId);
		else scServices.markedPages.removePageMarkedId(pId);

		if (!this.fOutlineLookup) {
			var vOutlineLookup = this.fOutlineLookup = {};
			var iOutlineSetup = function (pItem) {
				if (pItem.url) vOutlineLookup[pItem.scormId = scServices.markedPages.getIdFromUrl(pItem.url)] = pItem;
				if (pItem.children){
					for (var i=0; i < pItem.children.length; i++) iOutlineSetup(pItem.children[i]);
				}
			}
			iOutlineSetup(outMgr.getOutline().module);
		}
		var vOutNode = this.fOutlineLookup[pId];
		if (vOutNode.children){ // Set status on all descendants
			for (var i=0; i < vOutNode.children.length; i++) scormMgr.xSetSeenStatus(vOutNode.children[i].scormId, pSeen);
		}
		var iParentWalker = function (pItem) {
			if (pItem.parent && pItem.parent.url){
				if (pSeen){
					var vAllSeen = true;
					for (var i=0; i < pItem.parent.children.length; i++) {
						if (!scServices.markedPages.isPageMarkedId(pItem.parent.children[i].scormId)){
							vAllSeen = false;
							break;
						}
					}
					if (vAllSeen) scServices.markedPages.addPageMarkedId(pItem.parent.scormId);
				} else scServices.markedPages.removePageMarkedId(pItem.parent.scormId);
				iParentWalker(pItem.parent);
			}
		}
		iParentWalker(vOutNode);
	},
	xAddBtn : function(pParent, pClassName, pCapt, pTitle, pNxtSib) {
		var vBtn = scDynUiMgr.addElement("a", pParent, pClassName, pNxtSib);
		vBtn.href = "#";
		vBtn.target = "_self";
		vBtn.setAttribute("role", "button");
		if (pTitle) vBtn.setAttribute("title", pTitle);
		if (pCapt) vBtn.innerHTML = "<span>" + pCapt + "</span>"
		vBtn.onkeydown=function(pEvent){scDynUiMgr.handleBtnKeyDwn(pEvent);}
		vBtn.onkeyup=function(pEvent){scDynUiMgr.handleBtnKeyUp(pEvent);}
		return vBtn;
	},
}