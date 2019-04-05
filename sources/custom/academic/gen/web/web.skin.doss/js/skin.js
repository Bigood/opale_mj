// Empêcher la détection de mobile : https://stackoverflow.com/a/32547322/1437016
Object.defineProperty(tplMgr, "fScreenTouch", {value:false, configurable: false, writable: false });
Object.defineProperty(tplMgr, "fScreenSmall", {value:false, configurable: false, writable: false });